import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  MyHeaderDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDraweState();
}

class _MyHeaderDraweState extends State<MyHeaderDrawer> {
  final String logoPath = 'assets/images/slider/logo.png';
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 197, 197, 197),
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(logoPath),
                ),
              ),
            ),
            Text(
              'User Name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Text(
              'PhoneNumber User',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            )
          ],
        ));
  }
}
