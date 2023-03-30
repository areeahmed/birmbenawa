import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHeaderDrawer extends StatefulWidget {
  MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDraweState();
}

class _MyHeaderDraweState extends State<MyHeaderDrawer> {
  final String logoPath = 'assets/images/slider/logo.png';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Hive.openBox('user');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/logoNoBackground.png')),
          ),
          padding: EdgeInsets.only(top: 20.0),
        ),
      ],
    );
  }
}
