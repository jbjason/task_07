import 'package:flutter/material.dart';
import 'package:task_07/core/util/my_color.dart';

class AddtButton extends StatelessWidget {
  const AddtButton({required this.onSubmit, super.key});
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSubmit(),
      child: Container(
        height: 45,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: MyColor.loginGradient,
        ),
        child: const Center(
          child: Text(
            'Create New Task',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
