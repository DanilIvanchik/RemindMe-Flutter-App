import 'package:flutter/material.dart';
import 'package:flutter_remind_me_app/pages/main_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const RemindMe());
}

class RemindMe extends StatelessWidget {
  const RemindMe({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: MainPage(),
    );
  }
}
