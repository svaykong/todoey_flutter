import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'provider/task_provider.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        title: 'Todoey Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            primary: Colors.lightBlueAccent,
            secondary: Colors.white,
          ),
          useMaterial3: true,
        ),
        home: const TasksScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
