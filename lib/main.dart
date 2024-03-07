import 'package:cubit_todoapp/cubit/cubit_todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/pages/homepage.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => CubitTodo()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _updateStateFromJson() async {
    await context.read<CubitTodo>().loadListFromJson();
  }

  @override
  void initState() {
    super.initState();
    // aggiorna lo state leggendo dal file json in apertura (ATTENZIONE: questo è un metodo async e per sicurezza dovrebbe essere lanciato PRIMA di entrare in questa pagina)
    _updateStateFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      theme: ThemeData(
        // useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
