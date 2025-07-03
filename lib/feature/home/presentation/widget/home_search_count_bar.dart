import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task_07/core/util/my_color.dart';
import 'package:task_07/feature/home/presentation/provider/task_provider.dart';

class HomeSearchCountBar extends StatefulWidget {
  const HomeSearchCountBar({super.key});
  @override
  State<HomeSearchCountBar> createState() => _HomeSearchCountBarState();
}

class _HomeSearchCountBarState extends State<HomeSearchCountBar> {
  String _contactField = "";

  @override
  Widget build(BuildContext context) {
    final length = Provider.of<TaskProvider>(context).searchTaskList.length;
    return Column(
      children: [
        // search text-field
        _getSearchField,
        const SizedBox(height: 10),
        // count bar
        Align(
          alignment: Alignment.centerRight,
          child: Text("$length tasks found"),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  TextFormField get _getSearchField => TextFormField(
        textInputAction: TextInputAction.done,
        initialValue: _contactField,
        keyboardType: TextInputType.text,
        style: const TextStyle(letterSpacing: 2),
        // setiing maximum length of each field is 1
        inputFormatters: [LengthLimitingTextInputFormatter(11)],
        decoration: InputDecoration(
          hintText: "Search by name",
          hintStyle: const TextStyle(color: MyColor.inActiveColor),
          prefixIcon:
              const Icon(Icons.call_outlined, color: MyColor.inActiveColor),
        ),
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        onChanged: (val) {
          _contactField = val;
          _searchPatientForOther();
          setState(() {});
        },
      );

  void _searchPatientForOther() async {
    final data = Provider.of<TaskProvider>(context, listen: false);
    data.searchTask(_contactField, context);
  }
}
