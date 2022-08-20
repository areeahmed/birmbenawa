import 'package:birmbenawa/src/app.dart';
import 'package:birmbenawa/src/models/auth_provider.dart';
import 'package:birmbenawa/src/screens/Auth/phone_number_verification.dart';
import 'package:birmbenawa/src/screens/DrawerScreens/about_app_screen.dart';
import 'package:birmbenawa/src/screens/DrawerScreens/about_us_screen.dart';
import 'package:birmbenawa/src/drawer/head_of_drawer.dart';
import 'package:birmbenawa/src/screens/DrawerScreens/other_app_screen.dart';
import 'package:birmbenawa/src/screens/DrawerScreens/settign_screen.dart';
import 'package:birmbenawa/src/screens/LandScreen/introduction_slider_screen.dart';
import 'package:birmbenawa/src/screens/buying.dart';
import 'package:birmbenawa/src/screens/daily_reminder_screen.dart';
import 'package:birmbenawa/src/screens/debt_screen.dart';
import 'package:birmbenawa/src/screens/reminder_screen.dart';
import 'package:birmbenawa/src/screens/shoping_list_reminder_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPageScreen extends StatefulWidget {
  MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
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
    const DailyReminderPage(),
    const ShopingReminderPage(),
    DebtScreenView(),
    BuyingChatScreenView(),
  ];
  @override
  Widget build(BuildContext context) {
    const String logoPath = 'assets/images/slider/logo.png';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 98, 0, 255),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(206, 211, 210, 210).withAlpha(0),
      ),
      body: IndexedStack(
        index: currentIndexPage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontFamily: 'PeshangBold',
        ),
        selectedItemColor: const Color.fromARGB(255, 98, 0, 255),
        unselectedItemColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 187, 187, 187),
        onTap: (index) => setState(() => currentIndexPage = index),
        currentIndex: currentIndexPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: 'ئەمرۆ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
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
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
            ),
            label: 'بۆم بکرە',
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              //TODO the name and the phone number must be saved in the firestore and find it with UID
              MyHeaderDrawer(
                  userName: context.watch<AuthProvider>().nameControllerValue,
                  phoneNumber:
                      context.watch<AuthProvider>().phoneNumberControllerValue),
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
          menuItem(2, 'دەربارەی بەرنامە', Icons.check_circle,
              currentPage == DrawerSections.aboutApp ? true : false),
          menuItem(3, 'دەربارەی ئێمە', Icons.person,
              currentPage == DrawerSections.aboutUs ? true : false),
          menuItem(4, 'بەرنامەکانی تر', Icons.dashboard,
              currentPage == DrawerSections.otherApps ? true : false),
          menuItem(5, 'Sign Out', Icons.dashboard,
              currentPage == DrawerSections.signOut ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() async {
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
            } else if (id == 5) {
              await FirebaseAuth.instance.signOut();
              await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LandScreenSlides()));
            }
          });
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
                    fontFamily: 'PeshangBold',
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
}

enum DrawerSections {
  settings,
  aboutApp,
  aboutUs,
  otherApps,
  signOut,
}
