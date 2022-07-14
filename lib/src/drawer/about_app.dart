import 'package:flutter/material.dart';

class AboutAppPage extends StatefulWidget {
  AboutAppPage({Key? key}) : super(key: key);

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('About App'),
      ),
    );
  }
}
