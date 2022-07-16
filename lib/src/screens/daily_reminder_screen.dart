import 'package:birmbenawa/src/drawer/about_app.dart';
import 'package:birmbenawa/src/drawer/about_us.dart';
import 'package:birmbenawa/src/drawer/my_drawer_header.dart';
import 'package:birmbenawa/src/drawer/other_apps.dart';
import 'package:birmbenawa/src/drawer/settigns.dart';
import 'package:flutter/material.dart';

class DailyReminderPage extends StatefulWidget {
  const DailyReminderPage({Key? key}) : super(key: key);

  @override
  State<DailyReminderPage> createState() => _DailyReminderPageState();
}

class _DailyReminderPageState extends State<DailyReminderPage> {
  final String logoPath = 'assets/images/slider/logo.png';
  final _cards = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* Appbar ( LogoIcon - NameOfPageText - DarwerIcon)

      //* Text for greeting the user ( Hello Name of the user that we get from << RegisterPage >>)

      //* ListViewBuilder ==> Showing the cards that user will create and the screen show ( No Card is Created if the list was empty )

      //* Button Action to create a Card

      //* Cards contains ==> ( Title - Description - Time - Icon - color - remining time for reminding)
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
