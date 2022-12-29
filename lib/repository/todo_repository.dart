import 'package:dio/dio.dart';
import 'package:todolist/models/todo.dart';

class TodoRepository {
  final String api = 'https://jsonplaceholder.typicode.com';

  Future<List<Todo>> getTodos() async {
    await Future.delayed(const Duration(seconds: 3));
    final response = await Dio().get(
      '$api/todos',
    );
    if (response.statusCode == 200) {
      print(response.data);
      return parsedTodoJson(response.data);
    } else {
      throw Exception(
        'ERROR: on getting response! statusCode:${response.statusCode}',
      );
    }
  }

  List<Todo> parsedTodoJson(dynamic todoData) {
    return List<Todo>.from(todoData.map((todo) => Todo.fromJson(todo)));
  }

  Future<bool> addTodo(String title) async {
    Map<String, dynamic> parameters = <String, dynamic>{
      "userId": 1,
      "id": 999,
      "title": title,
      "completed": false
    };
    final response =
        await Dio().post('$api/todos', queryParameters: parameters);
    if (response.statusCode == 201) {
      print(response.data);
      return true;
    } else {
      throw Exception(
        'ERROR: on adding new todo! statusCode:${response.statusCode}',
      );
    }
  }
}
