import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_07/feature/add_task/presentation/widget/add_task_appbar.dart';
import 'package:task_07/feature/add_task/presentation/widget/add_task_button.dart';
import 'package:task_07/feature/add_task/presentation/widget/add_task_category_list.dart';
import 'package:task_07/feature/common/presentation/widget/cm_name_field.dart';
import 'package:task_07/feature/add_task/presentation/widget/add_task_time_date.dart';
import 'package:task_07/feature/home/data/model/task.dart';
import 'package:task_07/feature/home/presentation/provider/task_provider.dart';

class AddTaskBody extends StatefulWidget {
  const AddTaskBody({super.key, this.task});
  final Task? task;
  @override
  State<AddTaskBody> createState() => _AddTaskBodyState();
}

class _AddTaskBodyState extends State<AddTaskBody> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();
  final _dateController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  int _selectedCategory = 0;
  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _isEditMode = true;
      _titleController.text = widget.task!.title;
      _detailsController.text = widget.task!.details;
      _dateController.text = DateFormat.yMMMd().format(widget.task!.date);
      _startTimeController.text =
          "${widget.task!.startTime ~/ 60}:${widget.task!.startTime % 60}";
      _endTimeController.text =
          "${widget.task!.endTime ~/ 60}:${widget.task!.endTime % 60}";
      _selectedCategory = widget.task!.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // appBar
          SizedBox(
            height: size.height * .2,
            child: AddtAppbar(isEditMode: _isEditMode),
          ),
          // taskName textFiled
          CmNameField(hint: 'Your Task Name', controller: _titleController),
          const SizedBox(height: 20),
          // details textfield
          CmNameField(hint: 'Description', controller: _detailsController),
          const SizedBox(height: 35),
          // category List
          AddtCategoryList(
            onChange: _onCategoryChange,
            selectedCategory: _selectedCategory,
          ),
          const SizedBox(height: 35),
          // date, start & end time textFields
          AddTaskTimeDate(
            dateController: _dateController,
            startTimeController: _startTimeController,
            endTimeController: _endTimeController,
          ),
          const SizedBox(height: 40),
          // create task Button
          AddTaskButton(isEditMode: _isEditMode, onSubmit: _onSubmit),
        ],
      ),
    );
  }

  void _onCategoryChange(int i) => setState(() => _selectedCategory = i);

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    // splitting time as controller gives string "12:23"
    final startTimeSplit = _startTimeController.text.split(':');
    final startTime =
        int.parse(startTimeSplit[0]) * 60 + int.parse(startTimeSplit[1]);
    final endTimeSplit = _endTimeController.text.split(':');
    final endTime =
        int.parse(endTimeSplit[0]) * 60 + int.parse(endTimeSplit[1]);
    // adding task
    final data = Provider.of<TaskProvider>(context, listen: false);
    final task = Task(
      id: _isEditMode ? widget.task!.id : DateTime.now().toString(),
      title: _titleController.text.trim(),
      details: _detailsController.text.trim(),
      startTime: startTime,
      endTime: endTime,
      taskDate: DateFormat("MMM d, yyyy").parse(_dateController.text),
      date: DateTime.now(),
      category: _selectedCategory,
    );
    _isEditMode ? data.updateTask(task) : data.addTask(task);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailsController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }
}
