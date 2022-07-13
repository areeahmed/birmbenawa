import 'package:birmbenawa/src/drawer/my_drawer_header.dart';
import 'package:flutter/material.dart';

class DailyReminderPage extends StatefulWidget {
  const DailyReminderPage({Key? key}) : super(key: key);

  @override
  State<DailyReminderPage> createState() => _DailyReminderPageState();
}

class _DailyReminderPageState extends State<DailyReminderPage> {
  var currentPage = DrawerSections.settings;
  final String logoPath = 'assets/images/slider/logo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* Appbar ( LogoIcon - NameOfPageText - DarwerIcon)

      //* Text for greeting the user ( Hello Name of the user that we get from << RegisterPage >>)

      //* ListViewBuilder ==> Showing the cards that user will create and the screen show ( No Card is Created if the list was empty )

      //* Button Action to create a Card

      //* Cards contains ==> ( Title - Description - Time - Icon - color - remining time for reminding)

      appBar: AppBar(
        title: Image.asset(
          logoPath,
          width: 50,
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text(
          'Daily Reminder Screen',
          style: TextStyle(fontSize: 30),
        ),
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
              currentPage = DrawerSections.settings;
            } else if (id == 2) {
              currentPage = DrawerSections.aboutApp;
            } else if (id == 3) {
              currentPage = DrawerSections.aboutUs;
            } else if (id == 4) {
              currentPage = DrawerSections.otherApps;
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
}

enum DrawerSections {
  settings,
  aboutApp,
  aboutUs,
  otherApps,
}
