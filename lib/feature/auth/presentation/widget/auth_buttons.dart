import 'package:flutter/material.dart';
import 'package:task_07/core/util/my_color.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons(
      {required this.isLogin,
      required this.onPress,
      required this.isLoading,
      required this.onSubmit,
      super.key});
  final bool isLogin;
  final ValueNotifier<bool> isLoading;
  final Function onPress;
  final Function onSubmit;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLoading,
      builder: (context, bool isLoad, _) => isLoad
          ? Center(child: const CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // signIn text
                GestureDetector(
                  onTap: () => onSubmit(),
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: MyColor.loginGradient,
                    ),
                    child: Center(
                      child: Text(
                        isLogin ? 'Sign In' : 'Sign Up',
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                // create & already have account text
                Center(
                  child: TextButton(
                    onPressed: () => onPress(),
                    child: Text(
                      isLogin
                          ? 'Create new account'
                          : 'I already have an account',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white70),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
