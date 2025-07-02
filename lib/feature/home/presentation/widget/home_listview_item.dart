import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/feature/add_task/presentation/page/add_task_screen.dart';
import 'package:task_07/feature/home/data/model/task.dart';
import 'package:task_07/feature/home/data/repository/home_repository.dart';
import 'package:task_07/feature/home/presentation/widget/home_listview_item_bottom.dart';
import 'package:task_07/feature/home/presentation/widget/home_listview_item_top.dart';

class HomeListViewItem extends StatelessWidget {
  const HomeListViewItem({required this.task, super.key});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => AddTaskScreen(task: task)),
      ),
      child: Column(
        children: [
          // category type & delete Icon
          HomeListviewItemTop(task: task),
          Divider(color: Colors.grey[300]),
          const SizedBox(height: 5),
          // title & details
          Expanded(child: _body()),
          const SizedBox(height: 20),
          // starting, ending time & share icon
          HomeListviewItemBottom(task: task),
        ],
      ),
    );
  }

  Widget _body() => Row(
        children: [
          // left linear line color
          Container(
            width: 2.5,
            decoration: BoxDecoration(
              color: HomeRepository.taskCategories[task.category].color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Text(
                  task.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColor.logBackColor,
                  ),
                ),
                const SizedBox(height: 8),
                // details
                Text(
                  task.details,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.fjallaOne(
                    textStyle: const TextStyle(
                      fontSize: 8,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
