import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

//TODO adding 2 setting here 1 - app setting 2- profile setting
//* this is for settigns screen not builded yet
class _SettingsPageState extends State<SettingsPage> {
  final String logoPath = 'assets/images/slider/logo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontFamily: 'PeshangBold'),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
      ),
      body: const Center(
        child: Text('Settigns'),
      ),
    );
  }
}
