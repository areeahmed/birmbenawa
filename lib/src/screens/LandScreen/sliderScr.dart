import 'package:birmbenawa/src/screens/Auth/registeration.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class LandScreenSlides extends StatelessWidget {
  const LandScreenSlides({
    Key? key,
  }) : super(key: key);
  final String LogoPath = 'assets/logoNoBackground.png';
  final String ReminderPath = 'assets/images/slider/REMINDER.png';
  final String ShopPath = 'assets/images/slider/SHOP.png';
  final String WeeklyPath = 'assets/images/slider/Weekly.png';
  final String buyImageSlide = 'assets/images/Buy.png';
  final String debtListSlideImage = 'assets/images/slider/Debt_Analyses.png';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //? Dear Programmer To Know about ( IntroductionScreen ) you can check https://pub.dev/packages/introduction_screen
      child: IntroductionScreen(
        rtl: true,
        pages: [
          PageViewModel(
            title: 'Birmbenawa',
            body: 'Birmbenawa بەخێرهاتی بۆ بەرنامەی ',
            image: buildImage(LogoPath),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'ئاگادارکردنەوە',
            body: 'دەتوانی ئاگادارکردنەوەیەکی دیاریکراو بنووسی',
            image: buildImage(ReminderPath),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'لیستی ئەرکەکانم',
            body: 'لیستی ئەرکەکانت بیردەخاتەوە',
            image: buildImage(ShopPath),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'ئادارکرنەوەی ڕۆژانە',
            body: 'دەتوانی ئاگادارکردنەوەی ڕۆژانە دابنێیت',
            image: buildImage(WeeklyPath),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'بیرهێنانەوەی قەرز',
            body: 'لیستی قەرزەکانت بیردێنێتەوە',
            image: buildImage(debtListSlideImage),
            decoration: getPageDecoration(),
          ),
        ],
        done: const Text(
          'Start',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 98, 0, 255),
          ),
        ),
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: const Text(
          'Skip',
          style: TextStyle(
            color: Color.fromARGB(255, 98, 0, 255),
          ),
        ),
        onSkip: () => goToHome(context),
        showNextButton: true,
        next: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 98, 0, 255),
        ),
        dotsDecorator: getDotDecoration(),
        nextFlex: 0,
        skipOrBackFlex: 0,
      ),
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
      activeColor: const Color.fromARGB(255, 98, 0, 255),
      color: const Color.fromARGB(255, 177, 177, 177),
      size: const Size(8, 8),
      activeSize: const Size(22, 8),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));

  void goToHome(context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => RegisterationWidget()));

  Widget buildImage(String path) => Center(
        widthFactor: 350,
        child: Image.asset(
          path,
        ),
      );
  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'RaberB'),
        bodyTextStyle: TextStyle(fontSize: 20, fontFamily: 'RaberR'),
        bodyPadding: EdgeInsets.all(16),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
