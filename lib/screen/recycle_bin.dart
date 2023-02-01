import 'package:flutter/material.dart';

import 'package:todoappbloc/blocs/bloc_exports.dart';

import 'drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Bin'),
      ),
      body: Column(children: [
        Center(
          child: InkWell(
            child: const Chip(label: Text("Deleted All ")),
            onLongPress: () {
              context.read<TasksBloc>().add(DeleteBin());
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              var removedTasks = state.deletedTasks;
              return ListView.builder(
                itemBuilder: (context, index) {
                  var task = removedTasks[index];
                  return ListTile(
                    title: Text(
                      task.title,
                    ),
                    trailing: Wrap(
                      children: [
                        ElevatedButton(
                          child: const Text('remove'),
                          onPressed: () {
                            context
                                .read<TasksBloc>()
                                .add(RemovedTask(task: task));
                          },
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          child: const Text('Restore'),
                          onPressed: () {
                            context
                                .read<TasksBloc>()
                                .add(RestoreTask(task: task));
                          },
                        ),
                      ],
                    ),
                  );
                },
                itemCount: removedTasks.length,
              );
            },
          ),
        )
      ]),
    );
  }
}
