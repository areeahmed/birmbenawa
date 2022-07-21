import 'package:birmbenawa/src/components/custom_button.dart';
import 'package:birmbenawa/src/components/custom_toggle_Button.dart';
import 'package:birmbenawa/src/sample_feature/sliderScr.dart';
import 'package:flutter/material.dart';
import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // ? this single line belowe is to remove the debug banner
          debugShowCheckedModeBanner: false,
          home: LandScreenSlides(),
        );
      },
    );
  }
}
