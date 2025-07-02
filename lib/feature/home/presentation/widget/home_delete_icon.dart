import 'package:flutter/material.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/feature/home/data/model/task.dart';
import 'package:task_07/feature/home/data/repository/home_repository.dart';

class HomeDeleteIcon extends StatelessWidget {
  const HomeDeleteIcon({required this.task, super.key});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text(
              "Alert !!",
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Do You Really Want to Delete ?",
              style: TextStyle(
                fontSize: 12,
                color: MyColor.logBackColor.withOpacity(0.5),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text("No"),
              ),
            ],
          ),
        );
      },
      child: SizedBox(
        height: 14,
        width: 30,
        child: Center(
          child: Container(
            height: 2,
            width: 14,
            decoration: BoxDecoration(
              color: HomeRepository.taskCategories[task.category].color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
