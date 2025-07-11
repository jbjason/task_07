import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:task_07/core/util/my_color.dart';

class HomeCalender extends StatelessWidget {
  const HomeCalender({required this.selectedDate, super.key});
  final ValueNotifier<DateTime> selectedDate;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedDate,
      builder: (context, _, __) => CalendarTimeline(
        initialDate: selectedDate.value,
        firstDate: DateTime.now().subtract(const Duration(days: 4)),
        lastDate: DateTime.now().add(const Duration(days: 27)),
        onDateSelected: (date) => selectedDate.value = date,
        leftMargin: 20,
        monthColor: Colors.grey,
        dayColor: Colors.grey,
        activeDayColor: MyColor.homeBodyColor,
        dayNameColor: MyColor.homeBodyColor,
        activeBackgroundDayColor: MyColor.logBackColor.withOpacity(0.9),
        dotColor: MyColor.homeBodyColor,
        locale: 'en',
      ),
    );
  }
}
