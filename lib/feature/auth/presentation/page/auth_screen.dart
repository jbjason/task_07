// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/core/util/my_dialog.dart';
import 'package:task_07/core/util/my_string.dart';
import 'package:task_07/feature/auth/presentation/widget/auth_body.dart';
import 'package:task_07/feature/common/data/model/login_info.dart';
import 'package:task_07/feature/common/data/repository/cm_hive_repo.dart';
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
      ValueNotifier<bool> isLoading, BuildContext ctx) async {
    isLoading.value = true;
    String message = MyString.errorMsg;
    try {
      final auth = FirebaseAuth.instance;
      if (isLogin) {
        await auth.signInWithEmailAndPassword(email: email, password: pass);
      } else {
        await auth.createUserWithEmailAndPassword(email: email, password: pass);
      }
      // adding to local-storage
      CmHiveRepo().addHiveBoxInfo(LoginInfo(email: email, pass: pass));
      // navigating to home-screen
      Navigator.pushNamed(ctx, HomeScreen.routeName);
    } on PlatformException catch (err) {
      if (err.message == null) {
        message = err.message!;
      }
      isLoading.value = false;
      MyDialog().showFailedToast(msg: message, context: ctx);
    } catch (e) {
      isLoading.value = false;
      MyDialog().showFailedToast(msg: message, context: ctx);
    }
  }
}
