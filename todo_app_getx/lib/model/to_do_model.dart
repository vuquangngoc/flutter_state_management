import 'package:intl/intl.dart';

class ToDoModel {
  String task;
  String description;
  bool isDone;
  final String createDay =
      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

  ToDoModel({
    required this.task,
    required this.description,
    this.isDone = false,
  });
}
