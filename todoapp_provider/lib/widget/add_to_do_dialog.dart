import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:todoapp/widget/to_do_form.dart';

class AddToDoDialog extends StatefulWidget {
  const AddToDoDialog({Key? key}) : super(key: key);

  @override
  State<AddToDoDialog> createState() => _AddToDoDialogState();
}

class _AddToDoDialogState extends State<AddToDoDialog> {
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add to do'),
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min, // min height
          children: [
            ToDoForm(
                onchangeTitle: (title) => setState(() => this.title = title),
                onchangeDescription: (description) =>
                    setState((() => this.description = description)),
                onSaveToDo: addToDo),
          ],
        ),
      ),
    );
  }

  void addToDo() {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final todo = ToDo(
          createdTime: DateTime.now(),
          title: title,
          description: description,
          id: DateTime.now().toString());

      final provider = Provider.of<ToDosProvider>(context, listen: false);
      provider.addToDo(todo);
      Navigator.of(context).pop(context);
    }
  }
}
