import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/providers/todo_provider.dart';
import 'package:todolist/screens/home/components/home_app_bar.dart';
import 'package:todolist/screens/home/components/todos_list.dart';
import 'package:todolist/widgets/error_widget.dart';
import 'package:todolist/widgets/loading_widget.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return SafeArea(
      child: ref.watch(todoProvider).when(
        data: (List<Todo> data) {
          return CustomScrollView(
            slivers: <Widget>[
              HomeAppBar(
                totalTodos: data.length,
              ),
              TodosList(
                todoList: data,
              ),
            ],
          );
        },
        error: (Object error, StackTrace stackTrace) {
          return const LottieErrorWidget();
        },
        loading: () {
          return const LottieLoadingWidget();
        },
      ),
    );
  }
}
