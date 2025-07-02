import 'package:flutter/material.dart';
import 'package:task_07/config/extension/media_query_extension.dart';
import 'package:task_07/feature/home/presentation/widget/home_appbar.dart';
import 'package:task_07/feature/home/presentation/widget/home_listview.dart';
import 'package:task_07/feature/home/presentation/widget/home_painter.dart';
import 'package:task_07/feature/home/presentation/widget/home_title_button.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final selectedDate = ValueNotifier<DateTime>(DateTime.now());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // painter
            Positioned.fill(child: CustomPaint(painter: HomePainter())),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // appBar
                  SizedBox(
                    height: context.screenHeight * .26,
                    child: HomeAppBar(selectedDate: selectedDate),
                  ),
                  const SizedBox(height: 20),
                  // To-do title, date & addTask Button
                  HomeTitleButton(selectedDate: selectedDate),
                  const SizedBox(height: 20),
                  // To-do List
                  Expanded(child: HomeListView()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
