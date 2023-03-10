import 'package:flutter/material.dart';
import 'package:todoappbloc/blocs/bloc_exports.dart';
import 'package:todoappbloc/models/task.dart';
import '../widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  static const id = 'tasks_screen';
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final List<Task> taskList = state.allTasks;
        final String length = state.allTasks
            .where((element) => element.isDone == false)
            .length
            .toString();
        return Column(children: [
          Center(
            child: Chip(label: Text("$length Task Todo")),
          ),
          TaskList(tasklist: taskList)
        ]);
      },
    );
  }
}
