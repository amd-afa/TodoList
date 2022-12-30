import 'package:flutter/material.dart';
import 'package:todolist/screens/home/components/add_todo_dialog.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    required this.totalTodos,
    Key? key,
  }) : super(key: key);

  final int totalTodos;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 200,
      backgroundColor: Colors.transparent,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Hi Ahmad 👋',
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$totalTodos Total Tasks for you',
                      style: const TextStyle(
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
                          return const AddTodoDialog();
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
          ],
        ),
      ),
    );
  }
}
