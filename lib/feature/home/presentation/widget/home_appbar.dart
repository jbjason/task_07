// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/core/util/my_dimens.dart';
import 'package:task_07/feature/auth/presentation/page/auth_screen.dart';
import 'package:task_07/feature/common/data/repository/cm_hive_repo.dart';
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
            onTap: () async {
              // 1. firebase sign-out 
              // 2. delete local-storage
              // 3. navigate to auth-screen
              await FirebaseAuth.instance.signOut();
              CmHiveRepo().deleteHiveBoxInfo;
              Navigator.pushNamedAndRemoveUntil(
                  ctx, AuthScreen.routeName, (route) => false);
            },
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: MyColor.homeBodyColor,
              child:
                  Icon(Icons.power_settings_new, color: MyColor.logBackColor),
            ),
          ),
          // image circleAvatar
          MyDimens().getImageIcon(),
        ],
      );
}
