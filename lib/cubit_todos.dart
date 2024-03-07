import 'package:cubit_todoapp/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CubitTodo extends Cubit<List<Todo>> {
  CubitTodo() : super([]);

  void addTodo(Todo todo) {
    final List<Todo> newTodos = List.from(state);
    newTodos.add(todo);
    emit(newTodos);
  }

  void deleteTodo(int todoIndex) {
    final List<Todo> newTodos = List.from(state);
    newTodos.removeAt(todoIndex);
    emit(newTodos);
  }

  @override
  String toString() {
    final List<String> contentList =
        state.map((item) => item.toString()).toList();
    return contentList.toString();
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
