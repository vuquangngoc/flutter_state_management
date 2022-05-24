import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:todoapp/widget/todo.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<ToDosProvider>(context);
    final todolist = todoProvider.todos;
    return ListView.separated(
        itemBuilder: ((context, index) => ToDoWidGet(todo: todolist[index])),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: todolist.length);
  }
}
