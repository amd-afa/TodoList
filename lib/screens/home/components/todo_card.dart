import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    required this.title,
    required this.completed,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 80,
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 8,
                offset: Offset(0, 3),
              )
            ]),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(title),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    color: completed ? Colors.lightGreen : Colors.red,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
