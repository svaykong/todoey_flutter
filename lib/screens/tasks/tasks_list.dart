import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'task_tile.dart';
import '../../provider/task_provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskProvider>().tasks;
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) => TaskTile(
        task: tasks[index],
        index: index,
      ),
    );
  }
}


