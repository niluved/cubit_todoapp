import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit_todos.dart';
import '../../model/todo_model.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitTodo, List<Todo>>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () => context.read<CubitTodo>().deleteTodo(index),
                  child: Text(state[index].content),
                ),
              );
            });
      },
    );
  }
}
