import 'package:get/get.dart';
import 'package:todo_app_getx/model/to_do_model.dart';

class ToDoController extends GetxController {
  List<ToDoModel> todoListDelete = <ToDoModel>[].obs;

  final RxList<ToDoModel> fetchToDoList = <ToDoModel>[
    ToDoModel(task: 'Doing ToDo App', description: 'Using getx package'),
    ToDoModel(task: 'Go to Company', description: 'At 8h25p'),
    ToDoModel(task: 'Sleep', description: 'go to sleep soon'),
    ToDoModel(task: 'Play game', description: 'Play with my friend'),
  ].obs;

  List<ToDoModel> get getToDoList =>
      fetchToDoList.where((todo) => todo.isDone == false).toList().obs;
  List<ToDoModel> get completedList =>
      fetchToDoList.where((todo) => todo.isDone == true).toList();
  List<ToDoModel> get getListDelete => todoListDelete;

  void addToDo(ToDoModel todo) {
    fetchToDoList.add(todo);
  }

  // use with GetBuilder -> must update()
  void deleteTask(ToDoModel task) {
    fetchToDoList.remove(task);
    todoListDelete.add(task);
    update();
  }

  void deleteTaskUseObx(ToDoModel task) {
    todoListDelete.add(task);
    fetchToDoList.remove(task);
  }

  void updateToDo(ToDoModel todo, String task, String description) {
    //fetchToDoList.add(todo);
    todo.task = task;
    todo.description = description;
    fetchToDoList.refresh();
  }

  bool toggleToDoStatus(ToDoModel todo) {
    todo.isDone = !todo.isDone;
    fetchToDoList.refresh();
    return todo.isDone;
  }
}
