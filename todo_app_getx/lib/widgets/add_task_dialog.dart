import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/getx/todo_controller.dart';
import 'package:todo_app_getx/model/to_do_model.dart';
import 'package:todo_app_getx/widgets/todo_form_widget.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({Key? key}) : super(key: key);

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  String task = '';
  String description = '';
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ToDoFormWidGet(
                onChangeTask: (String task) => setState(() => this.task = task),
                onChangeDescription: (String desc) =>
                    setState(() => description = desc),
                saveToDo: addToDo)
          ],
        ),
      ),
    );
  }

  void addToDo() {
    if (_formkey.currentState!.validate()) {
      Get.back();
      Get.put(ToDoController())
          .addToDo(ToDoModel(task: task, description: description));
      Get.snackbar("Add ToDo", "Success",
          icon: const Icon(Icons.check, color: Colors.blue),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white);
    } else {
      return;
    }
  }
}
