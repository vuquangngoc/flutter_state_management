import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoapp/model/todo.dart';
import 'package:todoapp/provider/todos.dart';
import 'package:todoapp/widget/to_do_form.dart';

class EditToDo extends StatefulWidget {
  final ToDo todo;
  const EditToDo({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditToDo> createState() => _EditToDoState();
}

class _EditToDoState extends State<EditToDo> {
  late String title;
  late String description;
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit ToDo'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                final provider =
                    Provider.of<ToDosProvider>(context, listen: false);
                provider.removeToDo(widget.todo);

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Deleted this task'),
                ));
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: ToDoForm(
              title: title,
              description: description,
              onchangeTitle: (title) => setState(() {
                    this.title = title;
                  }),
              onchangeDescription: (description) => setState(() {
                    this.description = description;
                  }),
              onSaveToDo: saveToDo),
        ),
      ),
    );
  }

  void saveToDo() {
    if (!_formkey.currentState!.validate()) {
      return;
    } else {
      final provider = Provider.of<ToDosProvider>(context, listen: false);
      provider.updateToDo(widget.todo, title, description);
      Navigator.pop(context);
    }
  }
}
