import 'package:flutter/material.dart';
import 'package:task_07/core/base/base_client.dart';
import 'package:task_07/feature/home/data/model/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get getTasks => [..._tasks];

  Future<void> fetchTaskList(BuildContext ctx) async {
    final result = await BaseClientClass.getData(path: "posts", ctx: ctx);
    if (result != null) _tasks.add(Task.fromJson(result));
  }

  void addTask(Task task) {
    print("coming to add");
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      notifyListeners();
    }
  }
  void deleteTask(String id){
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
