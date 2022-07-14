import 'package:birmbenawa/src/drawer/about_app.dart';
import 'package:birmbenawa/src/drawer/about_us.dart';
import 'package:birmbenawa/src/drawer/my_drawer_header.dart';
import 'package:birmbenawa/src/drawer/other_apps.dart';
import 'package:birmbenawa/src/drawer/settigns.dart';
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
  var currentPage = DrawerSections.settings;
  int currentIndexPage = 0;
  final screens = [
    Reminderpage(),
    DailyReminderPage(),
    ShopingReminderPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final String logoPath = 'assets/images/slider/logo.png';
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          logoPath,
          width: 50,
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
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
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
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
      color: selected ? Colors.grey[300] : Colors.white,
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

  void goToHome(context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => MainPageScreen()));
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
