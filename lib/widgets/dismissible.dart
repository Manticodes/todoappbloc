import 'package:flutter/material.dart';
import 'package:todoappbloc/blocs/bloc_exports.dart';

import '../models/task.dart';

class DismissibleTile extends StatelessWidget {
  const DismissibleTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
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
      key: Key(task.id + task.isDone.toString()),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          context.read<TasksBloc>().add(DeleteTask(task: task));
        } else {
          context.read<TasksBloc>().add(UpdateTask(task: task));
        }
      },
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
              decoration: task.isDone! ? TextDecoration.lineThrough : null,
              decorationThickness: 4,
              decorationColor: Colors.purple),
        ),
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
          child: const Text('remove'),
          onTap: () {
            context.read<TasksBloc>().add(DeleteTask(task: task));
          },
        ),
      ),
    );
  }
}
