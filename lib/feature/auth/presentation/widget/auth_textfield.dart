import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_07/core/util/my_color.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {required this.controller, required this.title, super.key});
  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title text
        Text(
          title,
          style: GoogleFonts.fjallaOne(
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white70),
          ),
        ),
        const SizedBox(height: 2),
        //  textfield
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: MyColor.loginGradient,
          ),
          child: TextFormField(
            controller: controller,
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            validator: (value) {
              if (title.toLowerCase() == 'email') {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              } else if (title.toLowerCase() == 'username') {
                if (value!.isEmpty) {
                  return 'UserName should be 4 characters atleast';
                }
                return null;
              } else {
                if (value!.isEmpty || value.length <= 4) {
                  return 'Password should be 4 characters atleast';
                }
                return null;
              }
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
