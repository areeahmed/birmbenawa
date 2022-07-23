import 'dart:ui';

import 'package:birmbenawa/src/components/custom_button.dart';
import 'package:birmbenawa/src/components/general_custom_button.dart';
import 'package:birmbenawa/src/main_screen.dart';
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
  String userName = '';
  String phoneNumber = '';
  final String logInPath = 'assets/images/SignIn.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade300,
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            padding: const EdgeInsets.all(32),
            child: Column(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(60, 60, 60, 40),
                  child: Image.asset(
                    logInPath,
                    width: 120,
                  ),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: const Text(
                    'تۆمارکردن',
                    style: TextStyle(fontFamily: 'KurdBold', fontSize: 22),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: Offset(4, 4),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: Offset(-4, -4),
                        )
                      ]),
                  margin: const EdgeInsets.fromLTRB(20, 60, 20, 60),
                  padding: const EdgeInsets.fromLTRB(30, 60, 30, 60),
                  child: Column(
                    children: [
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.pink),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 98, 0, 255),
                            ),
                            prefixIconColor: Colors.pink,
                            labelText: 'Enter Name',
                            hintText: 'Enter Your Name'),
                        onChanged: (text) {
                          userName = text;
                          if (userName == null) {
                            userName = 'Unknown person';
                          } else {
                            userName = text;
                          }
                        },
                      ),
                      Divider(
                        thickness: 4,
                      ),
                      TextField(
                        style: TextStyle(),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Colors.pink),
                            prefixIcon: Icon(
                              Icons.call,
                              color: Color.fromARGB(255, 98, 0, 255),
                            ),
                            prefixIconColor: Colors.pink,
                            labelText: 'Enter Phone Number',
                            hintText: '#### ### ## ##'),
                        onChanged: (text) {
                          if (phoneNumber == null) {
                            phoneNumber = '0000 000 0000';
                          } else {
                            phoneNumber = text;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
                  child: GeneralCustomButtonWidget(
                    customHeight: 46,
                    customWidth: 200,
                    ontap: () => goToHome(context),
                    itemText: 'چوونەژوورەوە',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goToHome(context) => Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          MainPageScreen(userName: userName, phoneNumber: phoneNumber)));
}
