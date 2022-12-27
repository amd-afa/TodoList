import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/todo_provider.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({
    Key? key,
    required this.ref,
  }) : super(key: key);

  final WidgetRef ref;

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  TextEditingController textEditingControllerTodoInput =
      TextEditingController();
  FocusNode focusNodeTodoInput = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 350,
        height: 380,
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
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 26,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    String todoTitle = textEditingControllerTodoInput.text;
                    if (todoTitle.isNotEmpty) {
                      widget.ref.read(todoProvider.notifier).addTodo(
                            todoTitle,
                          );
                      Navigator.pop(context);
                    } else {
                      //TODO
                    }
                  },
                  icon: const Icon(
                    Icons.check,
                    size: 32,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SizedBox(
              width: double.infinity,
              child: TextField(
                controller: textEditingControllerTodoInput,
                focusNode: focusNodeTodoInput,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                style: const TextStyle(fontSize: 26),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Todo Title',
                  hintStyle: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 90,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(1, 0),
                  )
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      textEditingControllerTodoInput.text =
                          '🔥: ${textEditingControllerTodoInput.text}';
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '🔥',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      textEditingControllerTodoInput.text =
                          '⭐️: ${textEditingControllerTodoInput.text}';
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '⭐️',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      textEditingControllerTodoInput.text =
                          '⛄️: ${textEditingControllerTodoInput.text}';
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '⛄️',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ]),
          )
        ]),
      ),
    );
  }
}
