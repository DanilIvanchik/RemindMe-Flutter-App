import 'package:flutter/material.dart';
import 'package:flutter_remind_me_app/util/input_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  DateTime chosenDate;
  AddTask({super.key, required this.chosenDate});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
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
      ),
      body: Container(
        padding: EdgeInsets.only(left: 70, right: 70, top: 15),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Task",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const AddTaskInputFiels(hint: "Enter task's title", title: "Title"),
            const AddTaskInputFiels(hint: "Enter your note", title: "Note"),
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
            )
          ],
        )),
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2100));
  }
}
