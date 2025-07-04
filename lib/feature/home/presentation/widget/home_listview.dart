import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_07/feature/add_task/presentation/page/add_task_screen.dart';
import 'package:task_07/feature/home/data/repository/home_repository.dart';
import 'package:task_07/feature/home/presentation/provider/task_provider.dart';
import 'package:task_07/feature/home/presentation/widget/home_listview_item.dart';
import 'package:task_07/feature/home/presentation/widget/home_search_count_bar.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key, required this.fetchTaskFuture});
  final Future fetchTaskFuture;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchTaskFuture,
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
        return RefreshIndicator(
          backgroundColor: Colors.white,
          onRefresh: () => fetchTaskFuture,
          child: _getBody(context),
        );
      },
    );
  }

  Widget _getBody(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).searchTaskList;
    return Column(
      children: [
        // search bar & task-count
        HomeSearchCountBar(),
        // tasks list
        Expanded(
          child: ListView.separated(
            itemCount: tasks.length,
            clipBehavior: Clip.none,
            separatorBuilder: (_, __) => const SizedBox(height: 20),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddTaskScreen(task: tasks[i]),
                  ),
                ),
                child: HomeRepository.getGlassEffect(
                  child: HomeListViewItem(task: tasks[i]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  
}
