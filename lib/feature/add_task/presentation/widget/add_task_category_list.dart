import 'package:flutter/material.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/feature/home/data/repository/home_repository.dart';

class AddtCategoryList extends StatelessWidget {
  const AddtCategoryList(
      {required this.onChange, required this.selectedCategory, super.key});
  final Function onChange;
  final int selectedCategory;
  @override
  Widget build(BuildContext context) {
    final lableColor = MyColor.logBackColor.withOpacity(.3);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category label
        Text('CATEGORY', style: TextStyle(color: lableColor, fontSize: 13)),
        const SizedBox(height: 10),
        //category List
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              HomeRepository.taskCategories.length,
              (index) {
                final color = HomeRepository.taskCategories[index].color;
                final isSelect = selectedCategory == index;
                return GestureDetector(
                  onTap: () => onChange(index),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: isSelect ? color : color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          HomeRepository.taskCategories[index].title,
                          style: TextStyle(
                            color: isSelect ? Colors.white : color,
                          ),
                        ),
                      ),
                      if (isSelect)
                        Positioned(
                          top: -7,
                          right: 0,
                          child: Container(
                            height: 24,
                            width: 24,
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: color),
                              child: const FittedBox(
                                  child: Icon(Icons.add, color: Colors.white)),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
