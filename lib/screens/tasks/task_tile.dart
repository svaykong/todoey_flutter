import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
    required this.onLongPressCallback,
  }) : super(key: key);

  final String taskTitle;
  final bool isChecked;
  final ValueChanged<bool?> checkboxCallback;
  final VoidCallback onLongPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Theme.of(context).colorScheme.primary,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
