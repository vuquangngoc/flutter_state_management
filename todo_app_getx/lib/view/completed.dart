import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/getx/todo_controller.dart';

class CompletedTask extends StatelessWidget {
  CompletedTask({Key? key}) : super(key: key);
  ToDoController todoList = Get.put(ToDoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed'),
        centerTitle: true,
        backgroundColor:
            Get.theme.primaryColor, // get color of theme in Getmaterial
      ),
      body: Container(
          color: Colors.white,
          child: todoList.completedList.isEmpty
              ? const Center(
                  child: Text('Do not have  task completed'),
                )
              : Obx(
                  () => ListView.builder(
                    itemCount:
                        todoList.completedList.length, // length of todo list
                    itemBuilder: (context, index) => GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: [
                            Checkbox(
                                value: todoList.completedList[index].isDone,
                                onChanged: (_) {
                                  Get.showSnackbar(GetSnackBar(
                                    message: todoList.toggleToDoStatus(
                                            todoList.completedList[index])
                                        ? 'Completed'
                                        : 'Do not Completed',
                                  ));
                                }),
                            const SizedBox(width: 20),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  todoList.completedList[index].task,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColor),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: Text(
                                      todoList.completedList[index].description,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    todoList.completedList[index].createDay,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            TextButton(
                                onPressed: () {
                                  todoList.deleteTaskUseObx(
                                      todoList.completedList[index]);
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
