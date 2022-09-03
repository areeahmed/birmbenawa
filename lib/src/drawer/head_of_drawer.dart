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
    String name = Hive.box('user').get('name') ?? 'null';
    String phone = Hive.box('user').get('phone') ?? 'null';
    return Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/banner.jpg')),
        ),
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'RaberB',
              ),
            ),
            Text(
              '0$phone',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'RaberR',
              ),
            ),
          ],
        ));
  }
}
