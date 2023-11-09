import 'package:flutter/material.dart';

class AddTaskInputFiels extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const AddTaskInputFiels(
      {super.key,
      required this.hint,
      required this.title,
      this.controller,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(children: [
        Text(
          title,
          style: TextStyle(),
        )
      ]),
    );
  }
}
