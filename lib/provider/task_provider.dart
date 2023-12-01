import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final _tasks = <Task>[
    Task(
      'Buy milk',
      false,
      false,
    ),
    Task(
      'Buy eggs',
      false,
      false,
    ),
    Task(
      'Buy bread',
      false,
      true,
    ),
  ];

  List<Task> get tasks => _tasks;

  void clear() {
    _tasks.clear();
    notifyListeners();
  }

  Task _findTask(int index) {
    return _tasks.elementAt(index);
  }

  void check(int index) {
    final task = _findTask(index);
    task.checked = !task.checked;
    _tasks[index] = task;
    notifyListeners();
  }

  void addTask(String name) {
    final newTask = Task(name, false, false);
    _tasks.add(newTask);
    notifyListeners();
  }

  int get totalTasks => _tasks.length;
}
