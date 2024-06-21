import 'package:cubit_todoapp/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../repo/file_manager.dart';

class CubitTodo extends Cubit<List<Todo>> {
  CubitTodo() : super([]) {
    _loadListFromJson();
  }

  // funzione per leggere la lista dei Todo dal file json e aggiornare lo state
  Future<void> _loadListFromJson() async {
    try {
      // legge la lista dal file JSON
      List<dynamic>? jsonList = await FileManager.readJsonFile();
      debugPrint('lista letta dal file JSON');
      if (jsonList != null) {
        List<Todo> todoList = jsonList.map((item) => Todo.fromJson(item)).toList();
        emit(todoList);
      }
    } catch (e) {
      debugPrint('Error loading list: $e');
    }
  }

  Future<void> addTodo(Todo todo) async {
    final List<Todo> newTodos = List.from(state);
    newTodos.add(todo);
    // aggiorna il file json
    await FileManager.writeJsonFile(newTodos);
    debugPrint('file json aggiornato');
    // aggiorna lo state e notifica i listener
    emit(newTodos);
  }

  Future<void> deleteTodo(int todoIndex) async {
    final List<Todo> newTodos = List.from(state);
    newTodos.removeAt(todoIndex);
    // aggiorna il file json
    await FileManager.writeJsonFile(newTodos);
    debugPrint('file json aggiornato');
    // aggiorna lo state e notifica i listener
    emit(newTodos);
  }

  @override
  String toString() {
    final List<String> contentList = state.map((item) => item.toString()).toList();
    return contentList.toString();
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
