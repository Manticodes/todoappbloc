import 'package:flutter/material.dart';

import 'package:todoappbloc/blocs/bloc_exports.dart';

import 'drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Bin'),
      ),
      body: Column(children: [
        const Center(
          child: Chip(label: Text("Deleted Task ")),
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
                        InkWell(
                          child: const Text('remove'),
                          onTap: () {
                            context
                                .read<TasksBloc>()
                                .add(RemovedTask(task: task));
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
