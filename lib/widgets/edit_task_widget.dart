import 'package:flutter/material.dart';

import 'package:todoappbloc/blocs/bloc_exports.dart';
import 'package:todoappbloc/models/task.dart';

class EditTaskWidget extends StatelessWidget {
  const EditTaskWidget({
    Key? key,
    required this.oldtask,
  }) : super(key: key);
  final Task oldtask;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldtask.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldtask.description);

    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const Text(
            'Add your Task ',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                flex: 23,
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      label: Text('title'), border: OutlineInputBorder()),
                  autofocus: true,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 4,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        child: const Icon(Icons.done_outline_rounded,
                            color: Colors.white),
                      ),
                      onTap: () {
                        var task = Task(
                            title: titleController.text,
                            id: oldtask.id,
                            description: descriptionController.text,
                            isDone: oldtask.isDone,
                            isFav: oldtask.isFav);
                        context
                            .read<TasksBloc>()
                            .add(EditTask(task: task, oldtask: oldtask));

                        titleController.clear();
                        descriptionController.clear();
                        Navigator.of(context).pop();
                      },
                    )),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
                label: Text('Description'), border: OutlineInputBorder()),
            autofocus: true,
            minLines: 3,
            maxLines: 5,
          ),
        ]),
      ),
    );
  }
}
