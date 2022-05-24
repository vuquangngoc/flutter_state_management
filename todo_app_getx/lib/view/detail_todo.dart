import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/getx/todo_controller.dart';
import 'package:todo_app_getx/model/to_do_model.dart';

class DetailToDoScreen extends StatefulWidget {
  const DetailToDoScreen({Key? key}) : super(key: key);

  @override
  State<DetailToDoScreen> createState() => _DetailToDoScreenState();
}

class _DetailToDoScreenState extends State<DetailToDoScreen> {
  ToDoModel todo = Get.arguments;
  String task = '';
  String description = ' ';

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      task = todo.task;
      description = todo.description;
      print(task + 'và ' + description);
    });
  }

  void editToDo() {
    if (!_formkey.currentState!.validate()) {
      return;
    } else {
      ToDoController tbC = Get.find();
      tbC.updateToDo(todo, task, description);
      Get.back(result: 'editSuccess');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit to do'),
        centerTitle: true,
        backgroundColor: Get.theme.primaryColor,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.delete))],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: todo.task,
                    decoration: const InputDecoration(label: Text('Task')),
                    onChanged: (value) => setState(() {
                      task = value;
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is required';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    maxLines: 5,
                    initialValue: todo.description,
                    decoration:
                        const InputDecoration(label: Text('Description')),
                    onChanged: (value) => setState(() {
                      description = value;
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is required';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(onPressed: editToDo, child: const Text('Save'))
                ],
              )),
        ),
      ),
    );
  }
}
