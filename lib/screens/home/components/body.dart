import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/providers/todo_provider.dart';
import 'package:todolist/screens/home/components/add_todo_dialog.dart';
import 'package:todolist/screens/home/components/todos_list.dart';
import 'package:todolist/widgets/error_widget.dart';
import 'package:todolist/widgets/loading_widget.dart';

class HomeBody extends ConsumerStatefulWidget {
  const HomeBody({super.key});

  @override
  ConsumerState<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends ConsumerState<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Hi Ahmad 👋',
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '200 Tasks for you today',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddTodoDialog(ref: ref);
                          });
                    },
                    borderRadius: BorderRadius.circular(50),
                    splashColor: Colors.lightGreen.shade100,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 28,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 60),
              const Text(
                'Tasks',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              ref.watch(todoProvider).when(
                data: (List<Todo> data) {
                  return TodosList(todoList: data);
                },
                error: (Object error, StackTrace stackTrace) {
                  return const LottieErrorWidget();
                },
                loading: () {
                  return const LottieLoadingWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
