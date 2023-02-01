import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoappbloc/blocs/bloc_exports.dart';
import 'package:todoappbloc/widgets/edit_task_widget.dart';

import '../models/task.dart';

class DismissibleTile extends StatelessWidget {
  const DismissibleTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
            child: EditTaskWidget(oldtask: task),
          );
        });
  }

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
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                decoration: task.isDone! ? TextDecoration.lineThrough : null,
                decorationThickness: 4,
                decorationColor: Colors.purple),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                child: task.isFav!
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_border_rounded),
                onTap: () {
                  context.read<TasksBloc>().add(FavTask(task: task));
                },
              ),
              const SizedBox(
                width: 10,
              ),
              Checkbox(
                onChanged: (value) {
                  context.read<TasksBloc>().add(UpdateTask(task: task));
                },
                value: task.isDone,
              ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                      child: TextButton.icon(
                    label: const Text('Edit'),
                    onPressed: () => _editTask(context),
                    icon: const Icon(Icons.edit),
                  )),
                  PopupMenuItem(
                      child: TextButton.icon(
                    label: const Text('Delete'),
                    onPressed: () {
                      context.read<TasksBloc>().add(DeleteTask(task: task));
                    },
                    icon: const Icon(Icons.delete),
                  )),
                ],
              )
            ],
          ),
          subtitle: Text(DateFormat('dd-MM-yy hh:mm').format(DateTime.now()))),
    );
  }
}
