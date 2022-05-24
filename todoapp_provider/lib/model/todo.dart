class ToDoField {
  static const createdTime = 'createdTime';
}

class ToDo {
  DateTime createdTime;
  String id;
  String title;
  String description;
  bool isDone;

  ToDo(
      {required this.createdTime,
      required this.title,
      this.id = '',
      this.description = '',
      this.isDone = false});
}
