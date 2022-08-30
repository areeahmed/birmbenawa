import 'package:birmbenawa/src/myapp.dart';
import 'package:birmbenawa/src/screens/DrawerScreens/about_app.dart';
import 'package:birmbenawa/src/screens/DrawerScreens/about_us.dart';
import 'package:birmbenawa/src/drawer/head_of_drawer.dart';
import 'package:birmbenawa/src/screens/DrawerScreens/feed_back.dart';
import 'package:birmbenawa/src/screens/DrawerScreens/other_apps.dart';
import 'package:birmbenawa/src/screens/DrawerScreens/settigns.dart';
import 'package:birmbenawa/src/screens/daily_reminder_screen.dart';
import 'package:birmbenawa/src/screens/debt_screen.dart';
import 'package:birmbenawa/src/screens/reminder_screen.dart';
import 'package:birmbenawa/src/screens/todo_list_reminder_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPageScreen extends StatefulWidget {
  String? userName;
  String? phoneNumber;
  MainPageScreen({Key? key, this.userName, this.phoneNumber}) : super(key: key);

  @override
  State<MainPageScreen> createState() =>
      _MainPageScreenState(userName: userName, phoneNumber: phoneNumber);
}

class _MainPageScreenState extends State<MainPageScreen> {
  String? userName = 'Unknown';
  String? phoneNumber;
  _MainPageScreenState({this.userName, this.phoneNumber});
  var currentPage = DrawerSections.settings;
  int currentIndexPage = 0;
  final screens = [
    Reminderpage(),
    const DailyReminderPage(),
    const ShopingReminderPage(),
    DebtScreenView(),
  ];
  @override
  Widget build(BuildContext context) {
    const String logoPath = 'assets/images/slider/logo.png';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 98, 0, 255),
            fontSize: 20,
            fontFamily: 'RaberB'),
        title: currentIndexPage == 0
            ? Text('ئەمڕۆ')
            : currentIndexPage == 1
                ? Text('ڕۆژانە')
                : currentIndexPage == 2
                    ? Text('تاسکەکانم')
                    : currentIndexPage == 3
                        ? Text('قەرزەکان')
                        : Text(' '),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 98, 0, 255),
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: currentIndexPage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontFamily: 'RaberB',
        ),
        selectedItemColor: const Color.fromARGB(255, 98, 0, 255),
        unselectedItemColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 187, 187, 187),
        onTap: (index) => setState(() => currentIndexPage = index),
        currentIndex: currentIndexPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notification_add,
            ),
            label: 'ئەمرۆ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
            ),
            label: 'رۆژانە',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'لیست',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money,
            ),
            label: 'قەرزەکان',
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        //? showing the list of menu drawer
        children: [
          menuItem(1, 'دەستکاری کردن', Icons.settings,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(2, 'دەربارەی بەرنامە', Icons.info,
              currentPage == DrawerSections.aboutApp ? true : false),
          menuItem(3, 'دەربارەی ئێمە', FontAwesomeIcons.peopleGroup,
              currentPage == DrawerSections.aboutUs ? true : false),
          menuItem(4, 'بەرنامەکانی تر', FontAwesomeIcons.boxArchive,
              currentPage == DrawerSections.otherApps ? true : false),
          menuItem(5, 'Sign Out', FontAwesomeIcons.arrowRightFromBracket,
              currentPage == DrawerSections.signOut ? true : false),
          menuItem(6, 'Feed Back', Icons.feedback,
              currentPage == DrawerSections.feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      child: InkWell(
        onTap: () async {
          Navigator.pop(context);
          if (id == 1) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SettingsPage()));
          } else if (id == 2) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AboutAppPage()));
          } else if (id == 3) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AboutUsPage()));
          } else if (id == 4) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => OtherAppsPage()));
          } else if (id == 5) {
            showBottomSheet(context);
          } else if (id == 6) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => FeedBackScreen())));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: const Color.fromARGB(255, 98, 0, 255),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'RaberB',
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

  showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning,
                    size: 100,
                    color: Colors.orangeAccent,
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      margin: EdgeInsets.only(top: 20, bottom: 20, left: 70),
                      child: Text(
                          'ئایا دڵنیای لە دەرچوونی تەواوەتیت لە بەرنامەکە؟',
                          style: TextStyle(
                              fontFamily: 'PeshangBold', fontSize: 20)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60,
                        width: 120,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 98, 0, 255)),
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));
                            },
                            child: Text(
                              'بەڵێ',
                              style: TextStyle(fontFamily: 'PeshangBold'),
                            )),
                      ),
                      Container(
                        height: 60,
                        width: 120,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 98, 0, 255)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('نەخێر',
                                style: TextStyle(fontFamily: 'PeshangBold'))),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

enum DrawerSections {
  settings,
  aboutApp,
  aboutUs,
  otherApps,
  signOut,
  feedback,
}
