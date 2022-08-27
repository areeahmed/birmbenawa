import 'package:flutter/material.dart';

class AboutAppPage extends StatefulWidget {
  AboutAppPage({Key? key}) : super(key: key);

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

//TODO compelete this screen as posable as soon
//* this screen is for information about app like app version and owner and year of developed
class _AboutAppPageState extends State<AboutAppPage> {
  final String logoPath = 'assets/images/slider/logoNoBackground.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 98, 0, 255)),
        title: Text(
          'About App',
          style: TextStyle(color: Color.fromARGB(255, 98, 0, 255)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 12,
              ),
              height: 150,
              width: 150,
              child: Image.asset(logoPath),
            ),
            Text(
              '(Birmbenawa)بیرم بێنەوە',
              style: TextStyle(fontSize: 24, fontFamily: 'PeshangBold'),
            ),
            Center(
              child: Container(
                  height: 100,
                  width: 300,
                  child: Text(
                    'ئەم بەرنامەیە بۆ ئەوەیە شتە گرینگەکانت بیربێنێتەوە',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 16, fontFamily: 'PeshangBold'),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
