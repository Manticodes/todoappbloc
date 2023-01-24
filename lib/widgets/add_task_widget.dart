import 'package:flutter/material.dart';
import 'package:todoappbloc/blocs/bloc_exports.dart';
import 'package:todoappbloc/models/task.dart';
import 'package:todoappbloc/services/id_gen.dart';

class addTaskWidget extends StatelessWidget {
  const addTaskWidget({
    Key? key,
    required this.titleController,
  }) : super(key: key);

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
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
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 147, 211, 149),
                        child: Icon(Icons.done_outline_rounded,
                            color: Colors.white),
                      ),
                      onTap: () {
                        String id = IdGen.genId();
                        var task = Task(title: titleController.text, id: id);
                        context.read<TasksBloc>().add(AddTask(task: task));
                        print(id);

                        titleController.clear();
                      },
                    )),
              )
            ],
          )
        ]),
      ),
    );
  }
}
