import 'package:flutter/material.dart';
import 'package:task_07/core/util/my_color.dart';

class CmNameField extends StatelessWidget {
  const CmNameField({required this.hint, required this.controller, super.key});
  final TextEditingController controller;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Linear Color Line
        Container(
          width: 1,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColor.logBackColor,
          ),
        ),
        const SizedBox(width: 10),
        // textField
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(hintText: hint),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'Please Fill Up The Form';
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}
