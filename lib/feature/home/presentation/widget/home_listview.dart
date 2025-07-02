import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_07/feature/home/data/repository/home_repository.dart';
import 'package:task_07/feature/home/presentation/provider/task_provider.dart';
import 'package:task_07/feature/home/presentation/widget/home_listview_item.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1)),
      // Provider.of<TaskProvider>(context, listen: false).fetchTaskList(context),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapShot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapShot.error}',
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        final tasks = Provider.of<TaskProvider>(context).getTasks;
        return ListView.separated(
          itemCount: tasks.length,
          clipBehavior: Clip.none,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, i) {
            return HomeRepository().getGlassEffect(
              child: HomeListViewItem(task: tasks[i]),
            );
          },
        );
      },
    );
  }
}
