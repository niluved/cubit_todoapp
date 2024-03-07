import '../widgets/add_todo_dialog.dart';
import 'package:cubit_todoapp/cubit/cubit_todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_list_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Future<void> dialogToAddTodo() async {
    await showDialog(context: context, builder: (context) => const DialogAddTodo());
  }

  Future<void> _updateStateFromJson() async {
    await context.read<CubitTodo>().loadListFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Click Counter'),
      ),
      body: FutureBuilder<void>(
          future: _updateStateFromJson(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error loading list'));
            }
            return const TodoListPage();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: dialogToAddTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
