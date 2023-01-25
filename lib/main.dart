import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:todoappbloc/screen/task_screen.dart';

import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(BlocProvider(
    create: (context) => TasksBloc(),
    child: MaterialApp(
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          appBarTheme: AppBarTheme(centerTitle: true)),
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: TaskScreen(),
    ),
  ));

  /* BlocOverrides.runZoned(
    () => runApp(BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskScreen(),
      ),
    )),
  ); */
}
