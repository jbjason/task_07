import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_07/config/extension/media_query_extension.dart';
import 'package:task_07/feature/add_task/presentation/widget/add_task_body.dart';
import 'package:task_07/feature/add_task/presentation/widget/add_task_painter.dart';
import 'package:task_07/feature/home/data/model/task.dart';

class AddTaskScreen extends StatelessWidget {
  static const routeName = '/add-task-screen';
  const AddTaskScreen({super.key, this.task});
  final Task? task;
  @override
  Widget build(BuildContext context) {
    print("--------");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // back painter
            Positioned.fill(child: CustomPaint(painter: AddTaskPainter())),
            // body
            Container(
              height: context.screenHeight,
              width: context.screenWidth,
              padding:  EdgeInsets.symmetric(vertical: 20.w, horizontal: 25.w),
              child: SingleChildScrollView(
                child: AddTaskBody(task: task),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
