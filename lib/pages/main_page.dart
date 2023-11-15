import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remind_me_app/buttons/button.dart';
import 'package:flutter_remind_me_app/pages/add_task_bar_page.dart';
import 'package:flutter_remind_me_app/pages/schedule_page.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.white,
      body: mainPageBody(),
    );
  }

  Column mainPageBody() {
    return Column(children: [
      addTaskBar,
      Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: DatePicker(
          currentDate,
          height: 100,
          width: 80,
          initialSelectedDate: currentDate,
          selectionColor: Colors.pink.shade100,
          selectedTextColor: Colors.white,
          dateTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey)),
          dayTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey)),
          monthTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey)),
          onDateChange: (date) {
            date = currentDate;
          },
        ),
      )
    ]);
  }

  Row get addTaskBar {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22.0),
          child: Text(
            "Today",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(right: 10),
            child: MyButton(
              lable: "Add task",
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddTask(
                            chosenDate: currentDate,
                          ))),
            ))
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
              style: const TextStyle(
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
            onTap: () {
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
