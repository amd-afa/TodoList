import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/repository/locater.dart';
import 'package:todolist/repository/todo_repository.dart';

final StateNotifierProvider<TodoAsyncNotifier, AsyncValue<List<Todo>>>
    todoProvider =
    StateNotifierProvider<TodoAsyncNotifier, AsyncValue<List<Todo>>>(
  (ref) => TodoAsyncNotifier(),
);

class TodoAsyncNotifier extends StateNotifier<AsyncValue<List<Todo>>> {
  TodoAsyncNotifier() : super(const AsyncLoading()) {
    _intiState();
  }

  _intiState() async {
    try {
      final List<Todo> fetchedTodos = await getIt<TodoRepository>().getTodos();
      state = AsyncData(fetchedTodos);
    } catch (error) {
      state = AsyncError(
        error,
        StackTrace.fromString('Catch ERROR: when getting Todos'),
      );
    }
  }

  addTodo(String todoTitle) async {
    await getIt<TodoRepository>().addTodo(todoTitle);
    state = AsyncData([Todo(1, 1, todoTitle, false), ...state.asData!.value]);
  }
}
