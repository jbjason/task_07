import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        _iconText(CupertinoIcons.clock, startTime, context),
        _iconText(Icons.alarm_off_outlined, endTime, context),
        _iconText(Icons.share_outlined, 'Share', context),
      ],
    );
  }

  String _getTime(int time) {
    final startHour = time ~/ 60;
    final amPm = startHour > 12 ? 'pm' : 'am';
    return '$startHour:${time % 60} $amPm';
  }

  Widget _iconText(IconData icon, String title, BuildContext context) => Row(
        children: [
          Icon(icon, color: Colors.grey[400]),
          const SizedBox(width: 5),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!,
          ),
        ],
      );
}
