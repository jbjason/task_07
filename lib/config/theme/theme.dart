import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/core/util/my_string.dart';

abstract class AppTheme {
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        visualDensity: visualDensity,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.fjallaOne(
            textStyle: TextStyle(
              color: MyColor.textColor,
              fontFamily: MyString.libreBold,
              fontSize: 28.w,
            ),
          ),
          titleMedium: GoogleFonts.fjallaOne(
            textStyle: TextStyle(
              color: MyColor.textColor,
              fontSize: 25.w,
              fontFamily: MyString.libreBold,
            ),
          ),
          titleSmall: GoogleFonts.fjallaOne(
            textStyle: TextStyle(
              fontSize: 18.w,
              color: MyColor.textColor,
              fontFamily: MyString.libreBold,
            ),
          ),
          bodyLarge: GoogleFonts.fjallaOne(
            textStyle: TextStyle(
              fontSize: 17.w,
              color: MyColor.textColor,
              fontFamily: MyString.libreRegular,
            ),
          ),
          bodyMedium: GoogleFonts.fjallaOne(
            textStyle: TextStyle(
              fontSize: 14.w,
              color: MyColor.textColor,
              fontFamily: MyString.libreRegular,
            ),
          ),
          bodySmall: GoogleFonts.fjallaOne(
            textStyle: TextStyle(
              fontSize: 11.w,
              color: MyColor.textColor,
              fontFamily: MyString.libreRegular,
            ),
          ),
          labelLarge: TextStyle(
            fontSize: 16.w,
            color: MyColor.textColor,
            fontFamily: MyString.sherifTechRegular,
          ),
          labelMedium: TextStyle(
            fontSize: 14.w,
            color: MyColor.textColor,
            fontFamily: MyString.sherifTechRegular,
          ),
          labelSmall: TextStyle(
            fontSize: 11.w,
            color: MyColor.textColor,
            fontFamily: MyString.sherifTechRegular,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        cardColor: MyColor.cardLight,
        iconTheme: const IconThemeData(color: MyColor.bluePrimary),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white, size: 20),
          backgroundColor: MyColor.primaryColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 13.5,
            fontFamily: MyString.poppinsMedium,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MyColor.primaryColor,
          accentColor: MyColor.accentColor,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(fontSize: 12, color: MyColor.textThird),
          hintStyle: TextStyle(
              fontSize: 12, color: MyColor.textThird, letterSpacing: 1.2),
          isDense: true,
          filled: true,
          prefixIconColor: MyColor.textThird,
          fillColor: MyColor.cardBackgroundColor,
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: MyColor.inActiveColor, width: 0.3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: MyColor.inActiveColor, width: 0.3),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            elevation: WidgetStatePropertyAll(10),
            backgroundColor: WidgetStatePropertyAll(Colors.white),
          ),
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            filled: true,
            fillColor: MyColor.cardBackgroundColor,
            contentPadding:
                const EdgeInsets.only(left: 20, right: 5, top: 13, bottom: 13),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: MyColor.inActiveColor, width: 0.3),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: MyColor.inActiveColor, width: 0.3),
            ),
            iconColor: MyColor.inActiveColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            ),
            backgroundColor: WidgetStateProperty.all(MyColor.primaryColor),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          contentTextStyle: TextStyle(
            fontFamily: "Poppins_Regular",
            fontSize: 14.w,
            color: MyColor.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 14.w,
            fontFamily: MyString.rubikRegular,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelColor: MyColor.textThird,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: MyColor.skyPrimary,
          ),
        ),
      );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData().copyWith(
        visualDensity: visualDensity,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: MyColor.textLigth,
            fontSize: 17,
          ),
          titleMedium: TextStyle(
            color: MyColor.textLigth,
            fontSize: 11,
            letterSpacing: 0.3,
          ),
          bodyLarge: TextStyle(
            fontSize: 11,
            color: MyColor.textFaded,
          ),
          bodyMedium: TextStyle(
            fontSize: 11,
            color: MyColor.textFaded,
          ),
          bodySmall: TextStyle(
            fontSize: 11,
            color: MyColor.textFaded,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF1B1E1F),
        cardColor: MyColor.cardDark,
        iconTheme: const IconThemeData(color: MyColor.iconLight),
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(secondary: MyColor.accent)
            .copyWith(surface: const Color(0xFF1B1E1F)),
      );
}
