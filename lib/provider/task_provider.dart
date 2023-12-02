import 'dart:collection';

import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final _tasks = <Task>[
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void clear() {
    _tasks.clear();
    notifyListeners();
  }

  Task _findTask(int index) {
    return _tasks.elementAt(index);
  }

  void check(int index) {
    final task = _findTask(index);
    task.isDone = !task.isDone;
    _tasks[index] = task;
    notifyListeners();
  }

  void addTask(String newTaskTitle) {
    final newTask = Task(name: newTaskTitle);
    _tasks.add(newTask);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
