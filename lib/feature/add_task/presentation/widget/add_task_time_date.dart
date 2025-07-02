import 'package:flutter/material.dart';
import 'package:task_07/feature/common/presentation/widget/cm_clock_filed.dart';
import 'package:task_07/feature/common/presentation/widget/cm_date_field.dart';

class AddTaskTimeDate extends StatelessWidget {
  const AddTaskTimeDate({
    required this.dateController,
    required this.startTimeController,
    required this.endTimeController,
    super.key,
  });
  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Column(
        children: [
          // date
          CmDateField(label: "DATE", controller: dateController),
          // time textField
          Row(
            children: [
              // startTime
              Expanded(
                child: CmClockField(
                    label: "START TIME", controller: startTimeController),
              ),
              const SizedBox(width: 25),
              // endTime
              Expanded(
                child: CmClockField(
                    label: "End TIME", controller: endTimeController),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
