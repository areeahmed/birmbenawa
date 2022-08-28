import 'package:flutter/material.dart';

class MyDrawerList extends StatefulWidget {
  MyDrawerList({Key? key}) : super(key: key);

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

//TODO: change the type of showing screen
//* this screen is the list of the drawer
class _MyDrawerListState extends State<MyDrawerList> {
  var currentPage = DrawerSections.settings;

  @override
  Widget build(BuildContext context) {
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
                  color: Color.fromARGB(255, 98, 0, 255),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
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
}

enum DrawerSections {
  settings,
  aboutApp,
  aboutUs,
  otherApps,
}
