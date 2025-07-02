import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/feature/home/data/model/task.dart';

class HomeListviewItemBottom extends StatelessWidget {
  const HomeListviewItemBottom({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
     final startTime = _getTime(task.startTime);
    final endTime = _getTime(task.endTime);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Due-date
        _iconText(CupertinoIcons.clock, startTime),
        _iconText(Icons.alarm_off_outlined, endTime),
        _iconText(Icons.share_outlined, 'Share'),
      ],
    );
  }

  String _getTime(int time) {
    final startHour = time ~/ 60;
    final amPm = startHour > 12 ? 'pm' : 'am';
    return '$startHour:${time % 60} $amPm';
  }

  Widget _iconText(IconData icon, String title) => Row(
        children: [
          Icon(icon, color: Colors.grey[400]),
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 10, color: MyColor.logBackColor),
          ),
        ],
      );
}
