import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/getx/todo_controller.dart';
import 'package:todo_app_getx/model/to_do_model.dart';

class ToDoWidGet extends StatelessWidget {
  final ToDoModel todo;
  const ToDoWidGet({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Checkbox(
                  value: todo.isDone,
                  onChanged: (_) {
                    Get.snackbar("Change Status",
                        todo.isDone ? 'Completed' : 'Do not completed',
                        icon: const Icon(Icons.check, color: Colors.blue),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.white);
                  }),
              const SizedBox(width: 20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.task,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(todo.description,
                        style: const TextStyle(
                          fontSize: 18,
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      todo.createDay,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )),
              TextButton(
                  onPressed: () {
                    // todo.deleteTaskUseObx(todo);
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
