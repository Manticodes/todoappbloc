import 'package:flutter/material.dart';
import 'package:todoappbloc/blocs/bloc_exports.dart';

import '../models/task.dart';
import 'dismissible.dart';

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
          return DismissibleTile(task: task);
        },
        itemCount: tasklist.length,
      ),
    );
  }
}
