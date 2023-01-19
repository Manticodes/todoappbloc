import 'package:flutter/material.dart';
import 'package:todoappbloc/models/task.dart';
import 'package:todoappbloc/screen/task_screen.dart';

import 'blocs/bloc_exports.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(BlocProvider(
        create: (context) =>
            TasksBloc()..add(AddTask(task: Task(title: 'testing'))),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: TaskScreen(),
        ),
      )));
}
