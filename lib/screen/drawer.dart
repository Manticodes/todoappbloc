import 'package:flutter/material.dart';
import 'package:todoappbloc/screen/recycle_bin.dart';
import 'package:todoappbloc/screen/tab_screen.dart';
import 'package:todoappbloc/screen/task_screen.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/costume_divider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(16))),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(TabScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: Text(
                      'My Tasks',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: Text(state.allTasks.length.toString()),
                  ),
                );
              },
            ),
            const CostumeDivider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: Text(
                      'bin',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: Text(state.deletedTasks.length.toString()),
                  ),
                );
              },
            ),
            const CostumeDivider(),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text('Choose Theme'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.light_mode_rounded),
                  ),
                  BlocBuilder<SwitchBloc, SwitchState>(
                    builder: (context, state) {
                      return Switch(
                        value: state.switchValue,
                        onChanged: (value) {
                          context.read<SwitchBloc>().add(const SwitchEvent());
                        },
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(Icons.dark_mode_rounded),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
