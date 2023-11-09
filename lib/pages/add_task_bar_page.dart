import 'package:flutter/material.dart';
import 'package:flutter_remind_me_app/util/input_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTask extends StatelessWidget {
  DateTime chosenDate;
  AddTask({super.key, required this.chosenDate});

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
              DateFormat.MMMMd().format(chosenDate),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                DateFormat.y().format(chosenDate),
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
          children: [
            Text(
              "Add Task",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            AddTaskInputFiels(hint: "hint", title: "title")
          ],
        )),
      ),
    );
  }
}
