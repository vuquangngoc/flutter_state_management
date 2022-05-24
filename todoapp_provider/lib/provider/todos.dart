import 'package:flutter/cupertino.dart';
import 'package:todoapp/model/todo.dart';

class ToDosProvider extends ChangeNotifier {
  final List<ToDo> _todos = [
    ToDo(
        createdTime: DateTime.now(),
        title: ' Learn Flutter',
        description: 'Learn Flutter from basic to Advanced',
        isDone: false),
    ToDo(
        createdTime: DateTime.now(),
        title: ' Learn Dart',
        description: 'Leart Dart from basic',
        isDone: false),
    ToDo(
        createdTime: DateTime.now(),
        title: ' Learn Provider',
        description: 'Lear Provider from ',
        isDone: false),
    ToDo(
        createdTime: DateTime.now(),
        title: ' Learn Getx',
        description: 'Getx Getx',
        isDone: false),
    ToDo(
        createdTime: DateTime.now(),
        title: ' Learn basic layout',
        description: 'Row, Column, Container, Center, Scaffold...',
        isDone: false),
  ];

  List<ToDo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<ToDo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addToDo(ToDo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeToDo(ToDo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleToDoStatus(ToDo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateToDo(ToDo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
