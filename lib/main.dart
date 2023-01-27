import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:todoappbloc/screen/task_screen.dart';
import 'package:todoappbloc/services/app_router.dart';
import 'package:todoappbloc/services/color_scheme.g.dart';

import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
  });
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        )
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            darkTheme: ThemeData(
                colorScheme: darkColorScheme,
                useMaterial3: true,
                appBarTheme: const AppBarTheme(centerTitle: true)),
            themeMode: state.switchValue ? ThemeMode.dark : ThemeMode.light,
            title: 'Flutter Demo',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: lightColorScheme,
            ),
            home: TaskScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
