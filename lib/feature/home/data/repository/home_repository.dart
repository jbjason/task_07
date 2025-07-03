import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:task_07/feature/home/data/model/category.dart';

class HomeRepository {
  static const taskCategories = [
    Category(title: "URGENT", color: Color(0xFFFF3D00)),
    Category(title: "RUNNING", color: Color(0xFF69F0AE)),
    Category(title: "ONGOING", color: Color(0xFF673AB7)),
  ];

  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: Colors.grey[300]!,
          spreadRadius: 3,
          blurRadius: 10,
          offset: const Offset(2, 2),
        ),
        const BoxShadow(
          color: Colors.white,
          spreadRadius: 3,
          blurRadius: 10,
          offset: Offset(-2, -2),
        ),
      ];

  static Widget getGlassEffect({required Widget child}) {
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: HomeRepository.cardShadow),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Container(
            height: 160,
            padding:
                const EdgeInsets.only(left: 30, right: 20, top: 20, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white.withOpacity(.6)],
              ),
              border: Border.all(width: 1.2, color: Colors.white),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
