// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:task_07/feature/auth/presentation/page/auth_screen.dart';
import 'package:task_07/feature/common/data/repository/cm_hive_repo.dart';
import 'package:task_07/feature/home/presentation/page/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLocalStorage();
  }

  void _checkLocalStorage() async {
    AuthScreen.routeName;
    final hivePatBox = await CmHiveRepo.getHiveBoxInfo();
    Future.delayed(const Duration(milliseconds: 100)).then((_) {
      final page =
          hivePatBox == null ? AuthScreen.routeName : HomeScreen.routeName;
      Navigator.pushNamedAndRemoveUntil(context, page, (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
