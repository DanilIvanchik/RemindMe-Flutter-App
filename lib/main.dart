import 'package:flutter/material.dart';
import 'package:flutter_remind_me_app/pages/main_page.dart';

void main() {
  runApp(const RemindMe());
}

class RemindMe extends StatelessWidget {
  const RemindMe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: MainPage(),
    );
  }
}
