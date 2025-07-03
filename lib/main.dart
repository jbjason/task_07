import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_07/config/route/routes.dart';
import 'package:task_07/config/theme/theme.dart';
import 'package:task_07/core/util/my_string.dart';
import 'package:task_07/feature/auth/presentation/provider/auth_provider.dart';
import 'package:task_07/feature/common/presentation/page/splash_screen.dart';
import 'package:task_07/feature/home/presentation/provider/task_provider.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox(MyString.boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthProvider()),
            ChangeNotifierProvider(create: (_) => TaskProvider()),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routes.onGenerateRoute,
            theme: AppTheme.light(),
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
