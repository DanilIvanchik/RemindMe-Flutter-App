import 'package:flutter/material.dart';
import 'package:flutter_remind_me_app/buttons/button.dart';
import 'package:flutter_remind_me_app/controllers/task_controller.dart';
import 'package:flutter_remind_me_app/models/task.dart';
import 'package:flutter_remind_me_app/widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  DateTime chosenDate;
  AddTask({super.key, required this.chosenDate});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _noteEditingController = TextEditingController();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedReminder = 1;
  String _selectedRepeat = "Never";

  List<int> remindList = [1, 3, 5, 12, 24];
  List<String> RepeatList = [
    "Never",
    "Everyday",
    "Every week",
    "Every month",
    "Every year"
  ];

  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: taskPageAppBar(context),
      body: taskPageBody(),
    );
  }

  Container taskPageBody() {
    return Container(
      padding: EdgeInsets.only(left: 70, right: 70, top: 15),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Task",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          AddTaskInputFiels(
            hint: "Enter task's title",
            title: "Title",
            controller: _titleEditingController,
          ),
          AddTaskInputFiels(
            hint: "Enter your note",
            title: "Note",
            controller: _noteEditingController,
          ),
          AddTaskInputFiels(
            hint: DateFormat.yMd().format(widget.chosenDate),
            title: "Date",
            passedWidget: IconButton(
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                _getDateFromUser();
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: AddTaskInputFiels(
                title: "Start time",
                hint: _startTime,
                passedWidget: IconButton(
                  onPressed: () {
                    _getTimeFromUser(true);
                  },
                  icon: Icon(
                    Icons.access_time_filled_rounded,
                    color: Colors.grey,
                  ),
                ),
              )),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: AddTaskInputFiels(
                title: "End time",
                hint: _endTime,
                passedWidget: IconButton(
                  onPressed: () {
                    _getTimeFromUser(false);
                  },
                  icon: const Icon(
                    Icons.access_time_filled_rounded,
                    color: Colors.grey,
                  ),
                ),
              ))
            ],
          ),
          AddTaskInputFiels(
            hint: "$_selectedReminder hours early",
            title: "Remind",
            passedWidget: DropdownButton(
              items: remindList.map<DropdownMenuItem<String>>((int value) {
                return DropdownMenuItem<String>(
                  value: value.toString(),
                  child: Text(value.toString()),
                );
              }).toList(),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
              iconSize: 32,
              underline: Container(),
              elevation: 4,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedReminder = int.parse(newValue!);
                });
              },
            ),
          ),
          AddTaskInputFiels(
            hint: "$_selectedRepeat",
            title: "Repeat",
            passedWidget: DropdownButton(
              items: RepeatList.map<DropdownMenuItem<String>>((String? value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value!),
                );
              }).toList(),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
              iconSize: 32,
              underline: Container(),
              elevation: 4,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRepeat = newValue!;
                });
              },
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _colorPallet(),
              MyButton(lable: "Create task", onTap: () => _validateData())
            ],
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      )),
    );
  }

  AppBar taskPageAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,
        ),
      ),
      title: Row(
        children: [
          Text(
            DateFormat.MMMMd().format(widget.chosenDate),
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              DateFormat.y().format(widget.chosenDate),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.pink.shade100),
            ),
          ),
        ],
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2100));

    if (_datePicker != null) {
      setState(() {
        widget.chosenDate = _datePicker;
      });
    }
  }

  _getTimeFromUser(bool isStartTime) async {
    var pickedTime = await _showTimePicker();
    String formatedTime = pickedTime.format(context);

    if (isStartTime) {
      setState(() {
        _startTime = formatedTime;
      });
    } else {
      setState(() {
        _endTime = formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }

  TextStyle get getHeaderStyle {
    return const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black);
  }

  _validateData() {
    if (_titleEditingController.text.isNotEmpty &&
        _noteEditingController.text.isNotEmpty) {
      _addTaskToDB();
      Navigator.of(context).pop();
    } else if (_titleEditingController.text.isEmpty ||
        _noteEditingController.text.isEmpty) {
      Get.snackbar("Required", "All feileds are required!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade100,
          colorText: Colors.white,
          icon: Icon(
            Icons.warning_amber_rounded,
            color: Colors.white,
          ));
    }
  }

  _colorPallet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Color",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8, top: 8),
                child: CircleAvatar(
                  child: _selectedColor == index
                      ? Icon(Icons.done, color: Colors.white)
                      : Container(),
                  radius: 14,
                  backgroundColor: index == 0
                      ? Colors.pink.shade100
                      : index == 1
                          ? Colors.purple.shade100
                          : Colors.blueAccent.shade100,
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  void _addTaskToDB() {
    _taskController.addTask(
        task: Task(
            note: _noteEditingController.text,
            title: _titleEditingController.text,
            date: DateFormat.yMd().format(widget.chosenDate),
            startTime: _startTime,
            endTime: _endTime,
            remind: _selectedReminder,
            repeat: _selectedRepeat,
            color: _selectedColor,
            isCompleted: false));
  }
}
