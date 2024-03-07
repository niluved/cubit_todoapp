import 'package:cubit_todoapp/model/todo_model.dart';
import '../widgets/add_todo_dialog.dart';
import 'package:cubit_todoapp/cubit/cubit_todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Future<void> dialogToAddTodo() async {
    await showDialog(context: context, builder: (context) => const DialogAddTodo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Click Counter'),
      ),
      body: BlocBuilder<CubitTodo, List<Todo>>(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: dialogToAddTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
