import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/providers/todo_provider.dart';
import 'package:todolist/screens/home/components/todo_card.dart';

class TodosList extends ConsumerWidget {
  const TodosList({
    required this.todoList,
    Key? key,
  }) : super(key: key);
  final List<Todo> todoList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(todoProvider);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return TodoCard(
            title: todoList[index].title,
            completed: todoList[index].completed,
          );
        },
        childCount: todoList.length,
      ),
    );
  }
}
