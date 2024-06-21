import '../widgets/add_todo_dialog.dart';
import 'package:flutter/material.dart';
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

  // mi assicuro di aspettare che il cubit sia caricato prima di ritornare la todo list
  Future<void> _updateStateFromJson() async {
    // await context.read<CubitTodo>().loadListFromJson();
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('ciao mondo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Click Counter'),
      ),
      body: const TodoListPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: dialogToAddTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
