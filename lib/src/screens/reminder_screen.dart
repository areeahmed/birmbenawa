import 'package:birmbenawa/src/drawer/my_drawer_header.dart';
import 'package:flutter/material.dart';

class Reminderpage extends StatefulWidget {
  Reminderpage({Key? key}) : super(key: key);

  @override
  State<Reminderpage> createState() => _ReminderoageState();
}

class _ReminderoageState extends State<Reminderpage> {
  var currentPage = DrawerSections.settings;
  final String logoPath = 'assets/images/slider/logo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          logoPath,
          width: 50,
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Reminder Screen',
          style: TextStyle(fontSize: 40),
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
