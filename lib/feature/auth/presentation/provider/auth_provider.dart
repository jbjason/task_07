// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:task_07/core/util/my_dialog.dart';
import 'package:task_07/feature/common/data/model/login_info.dart';
import 'package:task_07/feature/common/data/repository/cm_hive_repo.dart';

class AuthProvider with ChangeNotifier {
  Future<String?> onFirebaseSignUpSignIn(
      {required String email,
      required String pass,
      required bool isLogin,
      required BuildContext ctx}) async {
    try {
      final auth = FirebaseAuth.instance;
      if (isLogin) {
        await auth.signInWithEmailAndPassword(email: email, password: pass);
      } else {
        await auth.createUserWithEmailAndPassword(email: email, password: pass);
      }
      // adding to local-storage
      CmHiveRepo().addHiveBoxInfo(LoginInfo(email: email, pass: pass));
      MyDialog()
          .showSuccessToast(msg: "Authentication successful", context: ctx);
      return "success";
    } on FirebaseAuthException catch (e) {
      Logger().e("Firebase error $e");
      MyDialog().showFailedToast(msg: e.code, context: ctx);
    } catch (e) {
      Logger().e("catch err: $e");
      MyDialog().showFailedToast(msg: e.toString(), context: ctx);
    }
    return null;
  }
}
