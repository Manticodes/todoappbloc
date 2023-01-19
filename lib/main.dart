import 'package:flutter/material.dart';
import 'package:todoappbloc/screen/task_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: TaskScreen(),
  ));
}
