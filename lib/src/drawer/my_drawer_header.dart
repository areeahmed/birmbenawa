import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  String userName;
  String phoneNumber;
  MyHeaderDrawer({
    Key? key,
    required this.userName,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() =>
      _MyHeaderDraweState(userName: userName, phoneNumber: phoneNumber);
}

//* this is the header of the drawer that conatiane ProfileImage - Name of the user - phone number
class _MyHeaderDraweState extends State<MyHeaderDrawer> {
  final String logoPath = 'assets/images/slider/logo.png';
  String userName;
  String phoneNumber;
  _MyHeaderDraweState({
    required this.userName,
    required this.phoneNumber,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 204, 174, 252),
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(logoPath),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
            ),
            Text(
              userName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Text(
              phoneNumber,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            )
          ],
        ));
  }
}
