import 'package:birmbenawa/src/CardWidgets/reminderCards.dart';
import 'package:birmbenawa/src/drawer/about_app.dart';
import 'package:birmbenawa/src/drawer/about_us.dart';
import 'package:birmbenawa/src/drawer/my_drawer_header.dart';
import 'package:birmbenawa/src/drawer/other_apps.dart';
import 'package:birmbenawa/src/drawer/settigns.dart';
import 'package:flutter/material.dart';

class Reminderpage extends StatefulWidget {
  Reminderpage({Key? key}) : super(key: key);

  @override
  State<Reminderpage> createState() => _ReminderoageState();
}

class _ReminderoageState extends State<Reminderpage> {
  List<ReminderCardPage> listOfCards = [];
  final String logoPath = 'assets/images/slider/logo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Reminder Screen',
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // navigate to edit card
        child: Icon(Icons.add),
      ),
    );
  }
}
