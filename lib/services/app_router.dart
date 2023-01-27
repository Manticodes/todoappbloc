import 'package:flutter/material.dart';
import 'package:todoappbloc/screen/recycle_bin.dart';
import 'package:todoappbloc/screen/tab_screen.dart';
import 'package:todoappbloc/screen/task_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (context) => const RecycleBin(),
        );
      case TaskScreen.id:
        return MaterialPageRoute(
          builder: (context) => const TaskScreen(),
        );
      case TabScreen.id:
        return MaterialPageRoute(
          builder: (context) => TabScreen(),
        );
      default:
        return null;
    }
  }
}
