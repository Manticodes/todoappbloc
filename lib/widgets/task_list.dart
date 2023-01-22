import 'package:flutter/material.dart';
import 'package:todoappbloc/blocs/bloc_exports.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasklist,
  }) : super(key: key);

  final List<Task> tasklist;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var task = tasklist[index];
          return Dismissible(
            background: Container(
              alignment: Alignment.centerLeft,
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(Icons.delete),
              ),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.green,
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(Icons.done),
              ),
            ),
            key: Key(task.title +
                task.isDone.toString() +
                task.isDeleted.toString()),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                context.read<TasksBloc>().add(DeleteTask(task: task));
              } else {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              }
            },
            child: ListTile(
              title: Text(task.title),
              trailing: Wrap(
                children: [
                  Checkbox(
                    onChanged: (value) {
                      context.read<TasksBloc>().add(UpdateTask(task: task));
                    },
                    value: task.isDone,
                  ),
                ],
              ),
              subtitle: InkWell(
                child: Text('remove'),
                onTap: () {
                  context.read<TasksBloc>().add(DeleteTask(task: task));
                },
              ),
            ),
          );
        },
        itemCount: tasklist.length,
      ),
    );
  }
}
