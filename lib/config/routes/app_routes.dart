import 'package:napotest/features/task_mangement/views/task_details_screen.dart';
import 'package:napotest/features/task_mangement/views/task_mangement_screen.dart';

class AppRoutes {
  static const String taskMangemnetScreenRoute = '/TaskMangemnetScreen';
  static const String taskDetailscreenRoute = '/TaskDetailscreenRoute';
  static final routes = {
    AppRoutes.taskMangemnetScreenRoute: (context) =>
        const TaskMangementScreen(),
  };
}
