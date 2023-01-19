import 'package:flutter/material.dart';
import 'package:todoappbloc/models/task.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});
  List<Task> tasklist = [
    Task(title: 'Task1'),
    Task(title: 'Task2'),
    Task(title: 'Task3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Column(children: [
        const Center(
          child: Chip(label: Text('Tasks')),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              var task = tasklist[index];
              return ListTile(
                title: Text(task.title),
                trailing: Checkbox(
                  onChanged: (value) {},
                  value: task.isDone,
                ),
              );
            },
            itemCount: tasklist.length,
          ),
        )
      ]),
    );
  }
}
