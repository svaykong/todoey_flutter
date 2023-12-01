import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/task_provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String _inputTextTodo = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0, bottom: 20.0),
      height: 200,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Add Task',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 22.0,
            ),
          ),
          TextField(
            autocorrect: false,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 5,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            onChanged: (String inputValue) {
              setState(() {
                _inputTextTodo = inputValue;
              });
            },
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
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
                    if (_inputTextTodo.isNotEmpty) {
                      context.read<TaskProvider>().addTask(_inputTextTodo);
                    }
                    Navigator.pop(context);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
