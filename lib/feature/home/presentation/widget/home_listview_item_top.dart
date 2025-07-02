import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_07/core/util/my_dialog.dart';
import 'package:task_07/feature/home/data/model/task.dart';
import 'package:task_07/feature/home/data/repository/home_repository.dart';
import 'package:task_07/feature/home/presentation/provider/task_provider.dart';

class HomeListviewItemTop extends StatelessWidget {
  const HomeListviewItemTop({required this.task, super.key});
  final Task task;
  @override
  Widget build(BuildContext context) {
    final color = HomeRepository.taskCategories[task.category].color;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // category title
        Text(
          HomeRepository.taskCategories[task.category].title,
          style: GoogleFonts.fjallaOne(
            textStyle: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        const SizedBox(width: 15),
        // delete icon
        InkWell(
          onTap: () => _onDeleteIconTap(task.id, context),
          child: SizedBox(
            height: 14,
            width: 30,
            child: Center(
              child: Container(
                height: 2,
                width: 14,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _onDeleteIconTap(String id, BuildContext context) {
    final data = Provider.of<TaskProvider>(context, listen: false);
    MyDialog().showAlertDialog(
      context: context,
      title: Text("Alert !!"),
      content: Text("Do You Really Want to Delete ?"),
      actions: [
        TextButton(
          onPressed: () {
            data.deleteTask(id);
            Navigator.pop(context);
          },
          child: const Text("Yes"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("No"),
        ),
      ],
    );
  }
}
