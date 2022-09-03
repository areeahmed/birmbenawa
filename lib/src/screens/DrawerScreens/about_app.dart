import 'package:flutter/material.dart';

class AboutAppPage extends StatefulWidget {
  AboutAppPage({Key? key}) : super(key: key);

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  final String logoPath = 'assets/logoNoBackground.png';
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
              style: TextStyle(fontSize: 24, fontFamily: 'RaberB'),
            ),
            Center(
              child: Container(
                  height: 100,
                  width: 300,
                  child: Text(
                    'ئەم بەرنامەیە بۆ ئەوەیە شتە گرینگەکانت بیربێنێتەوە',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20, fontFamily: 'RaberR'),
                  )),
            ),
            Center(
              child: Container(
                  height: 30,
                  width: 300,
                  child: Text(
                    'ڤێرژنی بەرنامە: 1.0.0',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20, fontFamily: 'RaberR'),
                  )),
            ),
            Center(
              child: Container(
                  height: 30,
                  width: 300,
                  child: Text(
                    ' بەرواری دروستبوونی: 3/9/2022',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20, fontFamily: 'RaberR'),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
