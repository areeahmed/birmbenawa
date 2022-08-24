import 'package:flutter/material.dart';

class InAlarmOnScreen extends StatefulWidget {
  InAlarmOnScreen({Key? key}) : super(key: key);

  @override
  State<InAlarmOnScreen> createState() => _InAlarmOnScreenState();
}

class _InAlarmOnScreenState extends State<InAlarmOnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //No AppBar

      body: Center(
        child: Column(
          children: [Text('Alarm On Screen')],
        ),
      ),
    );
  }
}
