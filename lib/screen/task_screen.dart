import 'package:flutter/material.dart';
import 'package:todoappbloc/blocs/bloc_exports.dart';
import 'package:todoappbloc/models/task.dart';

import '../widgets/add_task_widget.dart';
import '../widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AddTaskWidget(titleController: titleController),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final List<Task> taskList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todo App'),
          ),
          body: Column(children: [
            const Center(
              child: Chip(label: Text('Tasks')),
            ),
            TaskList(tasklist: taskList)
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
