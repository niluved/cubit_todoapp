import 'package:cubit_todoapp/cubit_todos.dart';
import 'package:cubit_todoapp/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogAddTodo extends StatelessWidget {
  const DialogAddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    return AlertDialog(
      content: TextField(controller: textController),
      actions: [
        ElevatedButton(
          onPressed: () {
            final Todo newTodo = Todo(content: textController.text);
            context.read<CubitTodo>().addTodo(newTodo);
            Navigator.pop(context);
          },
          child: const Text('confirm'),
        ),
      ],
    );
  }
}
