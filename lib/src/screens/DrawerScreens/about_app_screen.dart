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
        title: Text('دەربارەی بەرنامە',
            style: TextStyle(fontFamily: 'PeshangBold')),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
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
            Text('(Birmbenawa)بیرم بێنەوە',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PeshangBold')),
            Container(
              padding: EdgeInsets.only(
                right: 16,
                top: 30,
              ),
              height: 100,
              width: 350,
              child: Text(
                'ئەم بەرنامەیە بۆ ئەوەیە شتە گرینگەکانت بیربێنێتەوە',
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 19, fontFamily: 'PeshangBold'),
              ),
            ),
            SizedBox(
              width: 320,
              // TODO Version of the application
              child: Text(
                'ڤێرژنی بەرنامە :',
                style: TextStyle(fontSize: 19, fontFamily: 'PeshangBold'),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
