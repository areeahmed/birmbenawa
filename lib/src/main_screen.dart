import 'package:birmbenawa/src/screens/daily_reminder_screen.dart';
import 'package:birmbenawa/src/screens/reminder_screen.dart';
import 'package:birmbenawa/src/screens/shoping_list_reminder_screen.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatefulWidget {
  MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  int currentIndexPage = 0;
  final screens = [
    Reminderpage(),
    DailyReminderPage(),
    ShopingReminderPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndexPage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.black,
          backgroundColor: Color.fromARGB(255, 187, 187, 187),
          onTap: (index) => setState(() => currentIndexPage = index),
          currentIndex: currentIndexPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              label: 'Reminder',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
              ),
              label: 'Daily',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'List',
            )
          ]),
    );
  }
}
