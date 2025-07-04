import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_07/core/util/my_dimens.dart';

class AddtAppbar extends StatelessWidget {
  const AddtAppbar({super.key, required this.isEditMode});
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // back button
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
            // userImage icon
            MyDimens().getImageIcon(),
          ],
        ),
        // addTask text
        Padding(
          padding:  EdgeInsets.only(left: 20.w, top: 10.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: MyDimens()
                .getTitleText("${isEditMode ? "Update" : "Add"} Task", context),
          ),
        ),
      ],
    );
  }
}
