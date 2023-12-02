import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../provider/task_provider.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add Task',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 30.0,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            autofocus: true,
            autocorrect: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 5,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            onChanged: (String inputValue) {
              newTaskTitle = inputValue;
            },
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                if (newTaskTitle.isNotEmpty) {
                  context.read<TaskProvider>().addTask(newTaskTitle);
                }
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
