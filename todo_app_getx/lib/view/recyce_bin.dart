import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/todo_controller.dart';

class RecycleBinToDoScreen extends StatelessWidget {
  RecycleBinToDoScreen({Key? key}) : super(key: key);

  ToDoController todoList = Get.put(ToDoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Bin'),
        centerTitle: true,
        backgroundColor:
            Get.theme.primaryColor, // get color of theme in Getmaterial
      ),
      body: Container(
          color: Colors.white,
          child: todoList.todoListDelete.isEmpty
              ? const Center(
                  child: Text('Do not have  task in Recycle Bin'),
                )
              : Obx(
                  () => ListView.builder(
                    itemCount:
                        todoList.todoListDelete.length, // length of todo list
                    itemBuilder: (context, index) => GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  todoList.todoListDelete[index].task,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColor),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: Text(
                                      todoList
                                          .todoListDelete[index].description,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    todoList.todoListDelete[index].createDay,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
