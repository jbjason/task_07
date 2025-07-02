import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/core/util/my_image.dart';

class MyDimens {
  static const cmDivider = Divider(color: MyColor.inActiveColor, thickness: .5);

  static const loginGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [MyColor.logGradient1Color, MyColor.logGradient2Color],
  );

  final orageGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      MyColor.primaryColor,
      MyColor.primaryColor.withOpacity(.8),
      MyColor.accentColor,
    ],
  );

  static const bodyGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.white, Colors.white, Color(0xB3FFFFFF), Color(0x62FFFFFF)],
  );

  final bodyShadow = [
    BoxShadow(
      color: //Colors.grey[300]!, //
          const Color(0xFF3F6080).withOpacity(.4),
      blurRadius: 15,
      offset: const Offset(5, 5),
    ),
    BoxShadow(
      color: const Color(0xFFFFFFFF).withOpacity(1),
      blurRadius: 15,
      offset: const Offset(-5, -5),
    ),
  ];

  Widget getImageIcon() => CircleAvatar(
        radius: 24,
        backgroundColor: MyColor.homeBodyColor,
        child: const CircleAvatar(
          radius: 22,
          backgroundColor: Colors.transparent,
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(MyImage.randomImage),
          ),
        ),
      );

  Widget getTitleText(String title) => Text(
        title,
        style: GoogleFonts.fjallaOne(
          textStyle: const TextStyle(
            color: MyColor.logBackColor,
            fontSize: 27,
            letterSpacing: 1.5,
          ),
        ),
      );
}
