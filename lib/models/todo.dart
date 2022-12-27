import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable(explicitToJson: true)
class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(this.userId, this.id, this.title, this.completed);

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  // Todo.fromJson(Map<String, dynamic> json)
  //     : userId = json['userId'],
  //       id = json['id'],
  //       title = json['title'],
  //       completed = json['completed'];

  // Map<String, dynamic> toJson() => {
  //       'userId': userId,
  //       'id': id,
  //       'title': title,
  //       'completed': completed,
  //     };

}
