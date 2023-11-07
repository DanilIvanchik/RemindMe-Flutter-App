import 'package:flutter/material.dart';
import 'package:flutter_remind_me_app/schedule_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<DateTime> dates = [DateTime.now()];
  DateTime currentDate = DateTime.now();
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              months[currentDate.month - 1],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(currentDate.year.toString(),
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
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.settings,
              color: Colors.pink.shade100,
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
