import 'package:flutter/material.dart';
import 'package:task_07/feature/add_task/presentation/page/add_task_screen.dart';
import 'package:task_07/feature/auth/presentation/page/auth_screen.dart';
import 'package:task_07/feature/home/presentation/page/home_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AuthScreen.routeName:
        return MaterialPageRoute(builder: (context) => const AuthScreen());

      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case AddTaskScreen.routeName:
        return MaterialPageRoute(builder: (context) => const AddTaskScreen());
      default:
        null;
    }
    return null;
  }
}