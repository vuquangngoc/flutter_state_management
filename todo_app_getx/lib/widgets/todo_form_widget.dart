import 'package:flutter/material.dart';

class ToDoFormWidGet extends StatelessWidget {
  final String task;
  final String description;
  final ValueChanged<String> onChangeTask;
  final ValueChanged<String> onChangeDescription;
  final VoidCallback saveToDo;

  const ToDoFormWidGet(
      {Key? key,
      this.task = '',
      this.description = '',
      required this.onChangeTask,
      required this.onChangeDescription,
      required this.saveToDo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: '',
          onChanged: onChangeTask,
          decoration: const InputDecoration(label: Text('Task')),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field is required';
            }
            return null;
          },
        ),
        TextFormField(
          maxLines: 3,
          initialValue: '',
          onChanged: onChangeDescription,
          decoration: const InputDecoration(label: Text('Description')),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field is required';
            }
            return null;
          },
        ),
        ElevatedButton(onPressed: saveToDo, child: const Text('Save'))
      ],
    );
  }
}
