import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_07/config/extension/media_query_extension.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/feature/auth/presentation/widget/auth_buttons.dart';
import 'package:task_07/feature/auth/presentation/widget/auth_clippers.dart';
import 'package:task_07/feature/auth/presentation/widget/auth_textfield.dart';

class AuhtBody extends StatefulWidget {
  const AuhtBody({required this.onSubmit, required this.isLoading, super.key});
  final Function onSubmit;
  final ValueNotifier<bool> isLoading;
  @override
  State<AuhtBody> createState() => _AuhtBodyState();
}

class _AuhtBodyState extends State<AuhtBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  context.screenHeight * .5 ,
      width: context.screenWidth * .8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        gradient: MyColor.loginGradient,
      ),
      child: ClipPath(
        clipper: AuthClipper(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
          decoration: BoxDecoration(
            color: MyColor.logBackColor,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() => SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // login text & Image circleAvatar
                Center(
                  child: Text(
                     _isLogin ?'LOGIN' : 'SIGNUP',
                    style: GoogleFonts.fjallaOne(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: _isLogin ? 36 : 15),
              // email textfield
              AuthTextField(controller: _emailController, title: 'Email'),
              // pass textfield
              AuthTextField(controller: _passController, title: 'Password'),
              const SizedBox(height: 20),
              // submit, signup & sigin buttons
              AuthButtons(
                isLogin: _isLogin,
                onPress: _onPress,
                onSubmit: _onSubmit,
                isLoading: widget.isLoading,
              ),
            ],
          ),
        ),
      );

  void _onPress() => setState(() => _isLogin = !_isLogin);

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    widget.onSubmit(_emailController.text.trim(), _passController.text.trim(),
        _isLogin, widget.isLoading, context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }
}
