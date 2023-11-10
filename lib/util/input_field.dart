import 'package:flutter/material.dart';

class AddTaskInputFiels extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? passedWidget;

  const AddTaskInputFiels(
      {super.key,
      required this.hint,
      required this.title,
      this.controller,
      this.passedWidget});

  @override
  State<AddTaskInputFiels> createState() => _AddTaskInputFielsState();
}

class _AddTaskInputFielsState extends State<AddTaskInputFiels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 20),
        ),
        Container(
          height: 52,
          margin: EdgeInsets.only(top: 8),
          padding: EdgeInsets.only(left: 14),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                readOnly: widget.passedWidget == null ? false : true,
                autofocus: false,
                cursorColor: Colors.grey.shade700,
                controller: widget.controller,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0))),
              )),
              widget.passedWidget == null
                  ? Container()
                  : Container(
                      child: widget.passedWidget,
                    ),
            ],
          ),
        )
      ]),
    );
  }
}
