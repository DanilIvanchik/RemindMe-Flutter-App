import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String lable;
  final Function()? onTap;
  const MyButton({super.key, required this.lable, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.pink.shade100,
        ),
        child: Center(
          child: Text(
            lable,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
