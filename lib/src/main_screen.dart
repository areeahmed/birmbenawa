import 'package:birmbenawa/src/drawer/about_app.dart';
import 'package:birmbenawa/src/drawer/about_us.dart';
import 'package:birmbenawa/src/drawer/my_drawer_header.dart';
import 'package:birmbenawa/src/drawer/other_apps.dart';
import 'package:birmbenawa/src/drawer/settigns.dart';
import 'package:birmbenawa/src/screens/buying.dart';
import 'package:birmbenawa/src/screens/daily_reminder_screen.dart';
import 'package:birmbenawa/src/screens/debtscreen.dart';
import 'package:birmbenawa/src/screens/reminder_screen.dart';
import 'package:birmbenawa/src/screens/shoping_list_reminder_screen.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatefulWidget {
  String userName;
  String phoneNumber;
  MainPageScreen({Key? key, required this.userName, required this.phoneNumber})
      : super(key: key);

  @override
  State<MainPageScreen> createState() =>
      _MainPageScreenState(userName: userName, phoneNumber: phoneNumber);
}

class _MainPageScreenState extends State<MainPageScreen> {
  String userName;
  String phoneNumber;
  _MainPageScreenState({required this.userName, required this.phoneNumber});
  var currentPage = DrawerSections.settings;
  int currentIndexPage = 0;
  final screens = [
    Reminderpage(
      selectedTime: '',
      titleOfTheCard: '',
      icon: Icon(Icons.abc),
      timeH: 0,
      timeM: 0,
    ),
    DailyReminderPage(),
    ShopingReminderPage(),
    DebtScreenView(),
    BuyingChatScreenView(),
  ];
  @override
  Widget build(BuildContext context) {
    final String logoPath = 'assets/images/slider/logo.png';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          logoPath,
          width: 50,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 110, 110, 110).withAlpha(900),
      ),
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
            label: 'Todays',
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
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money,
            ),
            label: 'Debt',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
            ),
            label: 'Buy',
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              MyHeaderDrawer(userName: userName, phoneNumber: phoneNumber),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        //? showing the list of menu drawer
        children: [
          menuItem(1, 'Settigns', Icons.settings,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(2, 'About App', Icons.check_circle,
              currentPage == DrawerSections.aboutApp ? true : false),
          menuItem(3, 'About Us', Icons.person,
              currentPage == DrawerSections.aboutUs ? true : false),
          menuItem(4, 'Other Apps', Icons.dashboard,
              currentPage == DrawerSections.otherApps ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            } else if (id == 2) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AboutAppPage()));
            } else if (id == 3) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutUsPage()));
            } else if (id == 4) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OtherAppsPage()));
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void goToHome(context) => Navigator.of(context)
  //     .push(MaterialPageRoute(builder: (context) => MainPageScreen()));
}

//     SettingsPage(),
//     AboutAppPage(),
//     AboutUsPage(),
//     OtherAppsPage(),

enum DrawerSections {
  settings,
  aboutApp,
  aboutUs,
  otherApps,
}
