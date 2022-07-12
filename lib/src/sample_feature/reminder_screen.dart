import 'package:flutter/material.dart';

class Reminderpage extends StatefulWidget {
  Reminderpage({Key? key}) : super(key: key);

  @override
  State<Reminderpage> createState() => _ReminderoageState();
}

class _ReminderoageState extends State<Reminderpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Text('Remidner Screen'),
        ),),
    );
  }
  
}