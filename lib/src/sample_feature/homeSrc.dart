import 'package:birmbenawa/src/main_screen.dart';
import 'package:birmbenawa/src/screens/reminder_screen.dart';
import 'package:flutter/material.dart';

//! this is a registeration screen that containe ( Name and Phone number)
class GoHomePage extends StatefulWidget {
  const GoHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<GoHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<GoHomePage> {
  TextEditingController userName = new TextEditingController();
  final String logoPath = 'assets/images/slider/logo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(32),
          child: Column(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(60, 60, 60, 40),
                child: Image.asset(
                  logoPath,
                  width: 120,
                ),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                  child: const Text('تۆمارکردن',
                      style: TextStyle(fontFamily: 'KurdBold', fontSize: 22))),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(25)),
                margin: const EdgeInsets.fromLTRB(20, 60, 20, 60),
                padding: const EdgeInsets.fromLTRB(30, 60, 30, 60),
                child: Column(
                  children: [
                    TextField(
                      controller: userName,
                      style: TextStyle(),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Enter Name',
                          hintText: 'Enter Your Name'),
                    ),
                    Divider(
                      thickness: 4,
                    ),
                    TextField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Enter Name',
                          hintText: 'Enter Your Name'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.fromLTRB(40, 6, 0, 0),
                  height: 46,
                  width: 200,
                  child: const Text(
                    'چوونەژوورەوە',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'KurdBold'),
                  ),
                ),
                onPressed: () => goToHome(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void goToHome(context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => MainPageScreen()));
}
