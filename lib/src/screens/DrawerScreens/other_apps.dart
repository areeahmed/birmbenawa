import 'package:flutter/material.dart';

class OtherAppsPage extends StatelessWidget {
  final String logoPath = 'assets/images/slider/logo.png';
  const OtherAppsPage({Key? key}) : super(key: key);
  //* this is for other apps if the developer created another apps
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          logoPath,
          width: 50,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
      ),
      body: const Center(
        child: Text('Other Apps'),
      ),
    );
  }
}
