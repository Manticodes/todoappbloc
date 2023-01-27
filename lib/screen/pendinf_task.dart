import 'package:flutter/material.dart';
import 'package:todoappbloc/blocs/bloc_exports.dart';
import 'package:todoappbloc/models/task.dart';
import '../widgets/task_list.dart';

class PendingdScreen extends StatelessWidget {
  static const id = 'complete_screen';
  const PendingdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final List<Task> taskList =
            state.allTasks.where((element) => element.isDone == false).toList();
        final String length = taskList.length.toString();
        return Column(children: [
          Center(
            child: Chip(label: Text("$length Task ToDo")),
          ),
          TaskList(tasklist: taskList)
        ]);
      },
    );
  }
}
