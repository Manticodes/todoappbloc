import 'package:flutter/material.dart';
import 'package:todoappbloc/screen/com_task.dart';

import 'package:todoappbloc/screen/drawer.dart';
import 'package:todoappbloc/screen/fav_task.dart';
import 'package:todoappbloc/screen/pendinf_task.dart';
import 'package:todoappbloc/screen/task_screen.dart';

import '../widgets/add_task_widget.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const id = 'tabs_screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<Map<String, dynamic>> _pageDetails = [
    {'page': const TaskScreen(), 'tite': 'ToDo App'},
    {'page': const PendingdScreen(), 'tite': 'Pending Tasks'},
    {'page': const CompletedScreen(), 'tite': 'Done Tasks'},
    {'page': const FavScreen(), 'tite': 'Done Tasks'}
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
            child: AddTaskWidget(
                titleController: titleController,
                descriptionController: descriptionController),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_pageDetails[_selectedPageIndex]['tite'].toString())),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['page'],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (value) => setState(() {
          _selectedPageIndex = value;
        }),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'All Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle), label: 'pending Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'done Task'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Fav Task')
        ],
      ),
    );
  }
}
