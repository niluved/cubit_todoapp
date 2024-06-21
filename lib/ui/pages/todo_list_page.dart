import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit_todos.dart';
import '../../model/todo_model.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({
    super.key,
  });

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  /*
  late CubitTodo cubitTodo;

  @override
  void initState() {
    super.initState();
    cubitTodo = context.read<CubitTodo>(); // _loadFromJson will be called here (verificato togliendo il blocbuilder sotto)
  }
  */

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitTodo, List<Todo>>(
      // bloc: cubitTodo,
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
