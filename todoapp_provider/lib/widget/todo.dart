import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:todoapp/model/todo.dart';
import 'package:todoapp/page/edit_todo.dart';
import 'package:todoapp/provider/todos.dart';

class ToDoWidGet extends StatelessWidget {
  final ToDo todo;
  const ToDoWidGet({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) => editToDo(context, todo),
            backgroundColor: const Color.fromARGB(255, 0, 186, 248),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          )
        ]),
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) => deleteToDo(context, todo),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          )
        ]),
        child: buildToDo(context));
  }

  Widget buildToDo(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          children: [
            Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<ToDosProvider>(context, listen: false);
                  final isDone = provider.toggleToDoStatus(todo);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: isDone
                        ? const Text('Task Completed')
                        : const Text('Do not complete'),
                  ));
                }),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor),
                ),
                if (todo.description.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(
                      todo.description,
                      style: const TextStyle(fontSize: 18, height: 1.5),
                    ),
                  )
              ],
            ))
          ],
        ));
  }

  void deleteToDo(BuildContext context, ToDo todo) {
    final provider = Provider.of<ToDosProvider>(context, listen: false);
    provider.removeToDo(todo);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Deleted this task'),
    ));
  }

  void editToDo(BuildContext context, ToDo todo) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditToDo(todo: todo),
        ));
  }
}
