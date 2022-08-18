// import 'package:birmbenawa/src/screens/DrawerScreens/about_app.dart';
// import 'package:birmbenawa/src/screens/DrawerScreens/about_us.dart';
// import 'package:birmbenawa/src/screens/DrawerScreens/other_apps.dart';
// import 'package:birmbenawa/src/screens/DrawerScreens/settigns.dart';
// import 'package:birmbenawa/src/screens/LandScreen/main_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
// import 'package:hidden_drawer_menu/model/item_hidden_menu.dart';

// class HiddenDrawer extends StatefulWidget {
//   HiddenDrawer({Key? key}) : super(key: key);

//   @override
//   State<HiddenDrawer> createState() => _HiddenDrawerState();
// }

// class _HiddenDrawerState extends State<HiddenDrawer> {
//   List<ScreenHiddenDrawer> _pages = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _pages = [
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: 'Setting',
//           selectedStyle: TextStyle(),
//           baseStyle: TextStyle(),
//         ),
//         SettingsPage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: 'About Us',
//           selectedStyle: TextStyle(),
//           baseStyle: TextStyle(),
//         ),
//         AboutUsPage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: 'About App',
//           selectedStyle: TextStyle(),
//           baseStyle: TextStyle(),
//         ),
//         AboutAppPage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: 'Other App',
//           selectedStyle: TextStyle(),
//           baseStyle: TextStyle(),
//         ),
//         OtherAppsPage(),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HiddenDrawerMenu(
//       backgroundColorMenu: Colors.purple.shade200,
//       screens: _pages,
//       initPositionSelected: 0,
//     );
//   }
// }

//! this screen is a hidden screen
//! this screen will be here if we needed we will use it
