import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class BuyingChatScreenView extends StatefulWidget {
  BuyingChatScreenView({Key? key}) : super(key: key);

  @override
  State<BuyingChatScreenView> createState() => _BuyingChatScreenViewState();
}

//TODO [ Send Chat - check chat - List - Reminder Button]
//! this screen is on developing and it will be developed soon
class _BuyingChatScreenViewState extends State<BuyingChatScreenView> {
  final developModePathImage = 'assets/images/Developing.png';
  final userID = FirebaseAuth.instance.currentUser!.uid;
  bool isHasInternet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: !isHasInternet
            ? Center(
                child: Text('Internet is  Available'),
              )
            : Center(
                child: Text('Internet is not Available'),
              )
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Image.asset(developModePathImage),
        //       const Text(
        //         'On Developing',
        //         style: TextStyle(
        //           fontSize: 24,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }

  Future<bool> isConnectedToInternet() async {
    bool connectionChecker = await InternetConnectionChecker().hasConnection;
    setState(() {
      isHasInternet = connectionChecker;
    });
    return isHasInternet;
  }
}
