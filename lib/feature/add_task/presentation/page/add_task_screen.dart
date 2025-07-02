import 'package:flutter/material.dart';
import 'package:task_07/config/extension/media_query_extension.dart';
import 'package:task_07/feature/add_task/presentation/widget/add_task_body.dart';
import 'package:task_07/feature/add_task/presentation/widget/add_task_painter.dart';

class AddTaskScreen extends StatelessWidget {
  static const routeName = '/add-task-screen';
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: SingleChildScrollView(
                child: AddTaskBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
