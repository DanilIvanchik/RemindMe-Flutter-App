import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remind_me_app/buttons/button.dart';
import 'package:flutter_remind_me_app/schedule_page.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<DateTime> dates = [DateTime.now()];
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(children: [
        addTaskBar,
        Container(
          child: DatePicker(
            currentDate,
            height: 100,
            width: 80,
            initialSelectedDate: currentDate,
            selectionColor: Colors.pink.shade100,
            selectedTextColor: Colors.white,
            dateTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
        )
      ]),
    );
  }

  Row get addTaskBar {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Text(
            "Today",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: MyButton(lable: "Add task", onTap: () => null),
        )
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              DateFormat.MMMM().format(currentDate),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(DateFormat.y().format(currentDate),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.pink.shade100)),
          )
        ]),
        elevation: 0,
        actions: [
          GestureDetector(
            onDoubleTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SchedulePage(),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.schedule,
                color: Colors.pink.shade100,
              ),
            ),
          ),
          GestureDetector(
            onDoubleTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SchedulePage(),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.inbox,
                color: Colors.pink.shade100,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SchedulePage(),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.settings,
                color: Colors.pink.shade100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.star_border,
              color: Colors.pink.shade100,
            ),
          ),
        ]);
  }
}
