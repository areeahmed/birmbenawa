import 'package:birmbenawa/src/screens/sliderScr.dart';
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

    return const MaterialApp(
      // ? this single line belowe is to remove the debug banner
      debugShowCheckedModeBanner: false,
      home: LandScreenSlides(),
    );
  }
}
