import 'package:flutter/material.dart';
import 'package:task_07/core/base/base_client.dart';
import 'package:task_07/feature/home/data/model/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];
  List<Task> _searchTaskList = [];

  List<Task> get searchTaskList => [..._searchTaskList];

  Future<void> fetchTaskList(BuildContext ctx) async {
    final result = await BaseClientClass.getData(path: "task", ctx: ctx);
    if (result != null) {
      _tasks.clear();
      for (var item in result) {
        _tasks.add(Task.fromJson(item));
      }
      _searchTaskList = [..._tasks];
      notifyListeners();
    }
  }

  void searchTask(String name, BuildContext ctx) {
    final result = _tasks
        .where((task) => task.title.toLowerCase().contains(name.toLowerCase()))
        .toList();
    _searchTaskList = [...result];
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    _searchTaskList = [..._tasks];
    notifyListeners();
  }

  void updateTask(Task task) {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _searchTaskList[index] = task;
      notifyListeners();
    }
  }

  void resetTask() {
    _searchTaskList = [..._tasks];
    notifyListeners();
  }

  void deleteTask(String id) {
    _searchTaskList.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
