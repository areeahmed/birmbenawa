import 'package:birmbenawa/src/screens/LandScreen/main_screen.dart';
import 'package:birmbenawa/src/screens/LandScreen/sliderScr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.

    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                  body: Center(child: CircularProgressIndicator.adaptive())),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              home: Scaffold(
                  body: Center(child: Text(snapshot.error.toString()))),
            );
          } else if (snapshot.data == null) {
            return MaterialApp(
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
