import 'package:flutter/material.dart';

class ToDoForm extends StatelessWidget {
  final String title;
  final String description;

  final ValueChanged<String> onchangeTitle;
  final ValueChanged<String> onchangeDescription;
  final VoidCallback onSaveToDo;

  const ToDoForm({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onchangeTitle,
    required this.onchangeDescription,
    required this.onSaveToDo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitle(),
        buildDescription(),
        ElevatedButton(onPressed: onSaveToDo, child: const Text('Save'))
      ],
    );
  }

  Widget buildTitle() => TextFormField(
        initialValue: title,
        onChanged: onchangeTitle,
        decoration: const InputDecoration(
          label: Text('Title'),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field is required';
          }
          return null;
        },
      );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onchangeDescription,
        decoration: const InputDecoration(
          label: Text('Description'),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field is required';
          }
          return null;
        },
      );
}
