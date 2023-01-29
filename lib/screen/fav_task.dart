import 'package:flutter/material.dart';
import 'package:todoappbloc/blocs/bloc_exports.dart';
import 'package:todoappbloc/models/task.dart';
import '../widgets/task_list.dart';

class FavScreen extends StatelessWidget {
  static const id = 'complete_screen';
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final List<Task> taskList =
            state.allTasks.where((element) => element.isFav == true).toList();
        final String length = taskList.length.toString();
        return Column(children: [
          Center(
            child: Chip(label: Text("$length FAV Task")),
          ),
          TaskList(tasklist: taskList)
        ]);
      },
    );
  }
}
