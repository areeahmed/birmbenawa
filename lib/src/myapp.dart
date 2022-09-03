import 'package:birmbenawa/src/screens/LandScreen/Landing_screen.dart';
import 'package:birmbenawa/src/screens/LandScreen/sliderScr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(child: CircularProgressIndicator.adaptive())),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(child: Text(snapshot.error.toString()))),
            );
          } else if (snapshot.data == null) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LandScreenSlides(),
            );
          }
          return MaterialApp(
            // ? this single line belowe is to remove the debug banner
            debugShowCheckedModeBanner: false,
            home: MainPageScreen(),
          );
        });
  }
}
