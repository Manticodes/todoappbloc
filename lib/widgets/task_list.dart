import 'package:flutter/material.dart';
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
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
            elevation: 6,
            children: tasklist
                .map((task) => ExpansionPanelRadio(
                    value: task.id,
                    headerBuilder: (context, isExpanded) => isExpanded
                        ? Container(
                            alignment: Alignment.center,
                            child: Text(
                              task.title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          )
                        : DismissibleTile(task: task),
                    body: Container(
                        alignment: Alignment.centerLeft,
                        child: SelectableText.rich(TextSpan(children: [
                          const TextSpan(
                              text: 'Description:\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          TextSpan(
                              text: task.description,
                              style: const TextStyle(fontSize: 15.5))
                        ])))))
                .toList()),
      ),
    );
  }
}
