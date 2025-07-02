import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_07/config/route/routes.dart';
import 'package:task_07/config/theme/theme.dart';
import 'package:task_07/feature/home/presentation/page/home_screen.dart';
import 'package:task_07/feature/home/presentation/provider/task_provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        theme: AppTheme.light(),
        home: const HomeScreen(),
      ),
    );
  }
}
