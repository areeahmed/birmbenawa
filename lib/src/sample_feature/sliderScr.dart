import 'dart:math';
import 'package:birmbenawa/src/sample_feature/homeSrc.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:introduction_screen/introduction_screen.dart';

// TODO: Dear Programmer This screen is a land screen and the user will see those screens at first of downloading application
// TODO: Dear Programmer those screens is a slider for showing futures that this application will do
class LandScreenSlides extends StatelessWidget {
  const LandScreenSlides({
    Key? key,
  }) : super(key: key);
  final String LogoPath = 'assets/images/slider/logo.png';
  final String ReminderPath = 'assets/images/slider/REMINDER.png';
  final String ShopPath = 'assets/images/slider/SHOP.png';
  final String WeeklyPath = 'assets/images/slider/Weekly.png';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //? Dear Programmer To Know about ( IntroductionScreen ) you can check https://pub.dev/packages/introduction_screen
      child: IntroductionScreen(
        pages: [
          //! this is the all slides of my application
          //! it contains my Icons and titles and descriptions
          PageViewModel(
              title: 'Birmbenawa',
              body: 'Birmbenawa بەخێرهاتی بۆ بەرنامەی ',
              image: buildImage(LogoPath),
              decoration: getPageDecoration()),
          PageViewModel(
              title: 'ئاگادارکردنەوە',
              body: 'دەتوانی ئاگادارکردنەوەیەکی دیاریکراو بنووسی',
              image: buildImage(ReminderPath),
              decoration: getPageDecoration()),
          PageViewModel(
              title: 'لیستی کڕینەکان',
              body: 'لیستی کڕینی کەل و پەلت بیردەخاتەوە',
              image: buildImage(ShopPath),
              decoration: getPageDecoration()),
          PageViewModel(
              title: 'ئادارکرنەوەی ڕۆژانە',
              body: 'دەتوانی ئاگادارکردنەوەی ڕۆژانە دابنێیت',
              image: buildImage(WeeklyPath),
              decoration: getPageDecoration())
        ],
        // TODO: this is a button to continue the process of the sliding the screen to the new slide
        done: Text(
          'Start',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        // TODO navigating to Home page screen
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: const Text('Skip'),
        onSkip: () => goToHome(context),
        showNextButton: true,
        next: Icon(Icons.arrow_forward),
        dotsDecorator: getDotDecoration(),
        nextFlex: 0,
        skipOrBackFlex: 0,
      ),
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
      color: Color.fromARGB(255, 177, 177, 177),
      size: Size(8, 8),
      activeSize: Size(22, 8),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));

  void goToHome(context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => GoHomePage()));

  // TODO: this is a methode for Returning an Image with centered just by giving a path in String Type.
  Widget buildImage(String path) => Center(
        child: Image.asset(path),
        widthFactor: 350,
      );
  // TODO: this is a methode for Returning the decoration of title of the slider page
  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'KurdBold'),
        bodyTextStyle: TextStyle(fontSize: 20, fontFamily: 'KurdLight'),
        bodyPadding: EdgeInsets.all(16),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
