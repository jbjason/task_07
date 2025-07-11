import 'package:flutter/material.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/feature/home/data/model/task.dart';
import 'package:task_07/feature/home/data/repository/home_repository.dart';
import 'package:task_07/feature/home/presentation/widget/home_listview_item_bottom.dart';
import 'package:task_07/feature/home/presentation/widget/home_listview_item_top.dart';

class HomeListViewItem extends StatelessWidget {
  const HomeListViewItem({required this.task, super.key});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // category type & delete Icon
        HomeListviewItemTop(task: task),
        Divider(color: Colors.grey[300]),
        const SizedBox(height: 5),
        // title & details
        Expanded(child: _body(context)),
        const SizedBox(height: 20),
        // starting, ending time & share icon
        HomeListviewItemBottom(task: task),
      ],
    );
  }

  Widget _body(BuildContext context) => Row(
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
                Text(task.details,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 8,
                          color: Colors.grey,
                        )),
              ],
            ),
          ),
        ],
      );
}
