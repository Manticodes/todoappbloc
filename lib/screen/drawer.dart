import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
                      BorderRadius.only(topRight: Radius.circular(15))),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.folder_special),
              title: Text(
                'My Tasks',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Text('0'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                thickness: 0.3,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: Text(
                'bin',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Text('0'),
            )
          ],
        ),
      ),
    );
  }
}
