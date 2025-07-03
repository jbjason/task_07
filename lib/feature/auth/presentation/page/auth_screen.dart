// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/feature/auth/presentation/provider/auth_provider.dart';
import 'package:task_07/feature/auth/presentation/widget/auth_body.dart';
import 'package:task_07/feature/home/presentation/page/home_screen.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isLoading = ValueNotifier<bool>(false);
    return Scaffold(
      backgroundColor: MyColor.logBackColor,
      body: Center(child: AuhtBody(onSubmit: _onSubmit, isLoading: isLoading)),
    );
  }

  void _onSubmit(String email, String pass, bool isLogin,
      ValueNotifier<bool> isLoading, BuildContext context) async {
    isLoading.value = true;
    final data = Provider.of<AuthProvider>(context, listen: false);
    final result = await data.onFirebaseSignUpSignIn(
      email: email,
      pass: pass,
      isLogin: isLogin,
      ctx: context,
    );
    isLoading.value = false;
    // navigating to home-screen
    if (result != null) {
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }
}
