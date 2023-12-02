import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'add_task.dart';
import 'tasks_list.dart';
import '../../provider/task_provider.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30.0, top: 60.0, right: 30.0, bottom: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Theme.of(context).colorScheme.primary,
                      size: 36.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${context.read<TaskProvider>().taskCount} Tasks',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: const TasksList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTask(),
              ),
            ),
          ),
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 36,
          ),
        ),
      ),
    );
  }
}
