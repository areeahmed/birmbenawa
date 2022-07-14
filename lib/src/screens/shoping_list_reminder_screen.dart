import 'package:birmbenawa/src/drawer/about_app.dart';
import 'package:birmbenawa/src/drawer/about_us.dart';
import 'package:birmbenawa/src/drawer/my_drawer_header.dart';
import 'package:birmbenawa/src/drawer/other_apps.dart';
import 'package:birmbenawa/src/drawer/settigns.dart';
import 'package:flutter/material.dart';

class ShopingReminderPage extends StatefulWidget {
  const ShopingReminderPage({Key? key}) : super(key: key);

  @override
  State<ShopingReminderPage> createState() => _ShopingReminderPageState();
}

class _ShopingReminderPageState extends State<ShopingReminderPage> {
  final String logoPath = 'assets/images/slider/logo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'List Screen',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
