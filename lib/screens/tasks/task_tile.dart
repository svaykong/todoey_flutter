import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../models/task.dart';
import '../../provider/task_provider.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
    required this.index,
  }) : super(key: key);
  final Task task;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.name,
        style: task.crossed ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
      ),
      trailing: Checkbox(
        value: task.checked,
        onChanged: (value) => context.read<TaskProvider>().check(index),
      ),
    );
  }
}
