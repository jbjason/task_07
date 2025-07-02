import 'package:flutter/material.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/core/util/my_dimens.dart';
import 'package:task_07/feature/home/presentation/widget/home_calender.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({required this.selectedDate, super.key});
  final ValueNotifier<DateTime> selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //appBar
        _appBar(context),
        // calender
        Expanded(
          child: Center(child: HomeCalender(selectedDate: selectedDate)),
        ),
      ],
    );
  }

  Widget _appBar(BuildContext ctx) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // logout button
          GestureDetector(
            onTap: () {},
            child: const CircleAvatar(
              radius: 22,
              backgroundColor:MyColor. homeBodyColor,
              child: Icon(Icons.power_settings_new, color: MyColor.logBackColor),
            ),
          ),
          // image circleAvatar
          MyDimens().getImageIcon(),
        ],
      );
}
