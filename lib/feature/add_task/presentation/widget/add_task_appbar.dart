import 'package:flutter/material.dart';
import 'package:task_07/core/util/my_dimens.dart';

class AddtAppbar extends StatelessWidget {
  const AddtAppbar({super.key});

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
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: MyDimens().getTitleText('Add Task'),
          ),
        ),
      ],
    );
  }
}
