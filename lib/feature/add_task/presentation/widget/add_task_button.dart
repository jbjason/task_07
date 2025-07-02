import 'package:flutter/material.dart';
import 'package:task_07/core/util/my_color.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton(
      {required this.isEditMode, required this.onSubmit, super.key});
  final bool isEditMode;
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
        child: Center(
          child: Text(
            isEditMode ? "Update" : 'Create New Task',
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
