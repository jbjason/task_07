import 'dart:convert';
import 'package:task_07/core/error/safe_parse.dart';

class Task {
  final String id;
  final String title;
  final String details;
  final int startTime;
  final int endTime;
  final DateTime date;
  final DateTime taskDate;
  final int category;
  const Task({
    required this.id,
    required this.title,
    required this.details,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.taskDate,
    required this.category,
  });

  Task copyWith({
    String? id,
    String? title,
    String? details,
    int? startTime,
    int? endTime,
    DateTime? date,
    DateTime? taskDate,
    int? category,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      details: details ?? this.details,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      date: date ?? this.date,
      taskDate: taskDate ?? this.taskDate,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'details': details,
      'startTime': startTime,
      'endTime': endTime,
      'date': date.millisecondsSinceEpoch,
      'taskDate': taskDate.millisecondsSinceEpoch,
      'category': category,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: safeParse<String>(map['id'], 'id')!,
      title: safeParse<String>(map['title'], 'title')!,
      details: safeParse<String>(map['details'], 'details')!,
      startTime: safeParse<int>(map['startTime'], 'startTime')!,
      endTime: safeParse<int>(map['endTime'], 'endTime')!,
      date: DateTime.fromMillisecondsSinceEpoch(
          safeParse<int>(map['date'], 'date')!),
      taskDate: DateTime.fromMillisecondsSinceEpoch(
          safeParse<int>(map['taskDate'], 'taskDate')!),
      category: (safeParse<int>(map['category'], 'category')!) % 3,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(dynamic source) =>
      Task.fromMap(source as Map<String, dynamic>);
}
