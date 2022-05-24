import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:todoapp/widget/todo.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<ToDosProvider>(context);
    final todolist = todoProvider.todosCompleted;
    return todolist.isEmpty
        ? const Center(
            child: Text('No Task Completed'),
          )
        : ListView.separated(
            itemBuilder: ((context, index) =>
                ToDoWidGet(todo: todolist[index])),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: todolist.length);
  }
}
