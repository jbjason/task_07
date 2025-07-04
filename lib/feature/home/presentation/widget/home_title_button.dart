import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/core/util/my_dimens.dart';
import 'package:task_07/feature/add_task/presentation/page/add_task_screen.dart';

class HomeTitleButton extends StatelessWidget {
  const HomeTitleButton({required this.selectedDate, super.key});
  final ValueNotifier<DateTime> selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // title
          MyDimens().getTitleText('TODO', context),
          const SizedBox(width: 8),
          // todays date
          ValueListenableBuilder(
            valueListenable: selectedDate,
            builder: (context, val, __) {
              final date = DateFormat('MMM d').format(val);
              return Text(
                date,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.grey),
              );
            },
          ),
          const Spacer(),
          // addTask Button
          ElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, AddTaskScreen.routeName),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: const [
                Icon(Icons.add),
                SizedBox(width: 5),
                Text('Add Task',
                    style: TextStyle(color: MyColor.homeText1Color)),
                SizedBox(width: 7),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
