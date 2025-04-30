import 'package:flutter/material.dart';
import 'package:napotest/config/routes/app_routes.dart';
import 'package:napotest/config/routes/navigation_app.dart';
import 'package:napotest/features/task_mangement/provider/task_mangment_provider.dart';
import 'package:napotest/features/task_mangement/views/task_mangement_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TaskMangemnetProvider>(
      create: (context) => TaskMangemnetProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationApp.navigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      routes: AppRoutes.routes,
      home: const TaskMangementScreen(),
    );
  }
}
