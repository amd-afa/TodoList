import 'package:flutter/material.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/screens/home/components/todo_card.dart';

class TodosList extends StatelessWidget {
  const TodosList({
    required this.todoList,
    Key? key,
  }) : super(key: key);

  final List<Todo> todoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // We turn off List view scrolling cuz we have singleChildScroll
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int position) {
          return TodoCard(
            title: todoList[position].title,
            completed: todoList[position].completed,
          );
        });
  }
}
