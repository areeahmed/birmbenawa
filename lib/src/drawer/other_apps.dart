import 'package:flutter/material.dart';

class OtherAppsPage extends StatelessWidget {
  final String logoPath = 'assets/images/slider/logo.png';
  const OtherAppsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          logoPath,
          width: 50,
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text('Other Apps'),
      ),
    );
  }
}
