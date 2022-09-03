import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsPage extends StatelessWidget {
  final String logoPath = 'assets/images/slider/logoNoBackground.png';
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = Uri.decodeComponent('https://www.facebook.com/aree.ahmed.311');
    String instagramIconPath = 'assets/icons/favicon.ico';
    String ownerPicturePath = 'assets/images/AriAhmedPic.png';
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 98, 0, 255)),
        title: Text(
          'About Us',
          style: TextStyle(color: Color.fromARGB(255, 98, 0, 255)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              OwnerAvatar(ownerPicturePath: ownerPicturePath),
              const SizedBox(height: 35),
              Text(
                //
                textDirection: TextDirection.rtl,
                'ئاری احمد ابراهیم',
                style: TextStyle(fontSize: 20, fontFamily: 'RaberB'),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Text(
                  textDirection: TextDirection.rtl,
                  'خوێندکارم لە زانکۆی سەڵاحەدین کۆلێژی زانست بەشی ئایتی',
                  style: TextStyle(fontSize: 20, fontFamily: 'RaberB'),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Text(
                  textDirection: TextDirection.rtl,
                  'سڵاو بەکارهێنەری خۆشەویست، هیوادارم ئەم بەرنامەیەی منت بە دڵ بێت، سوودی زۆری هەبێت بۆ بەڕێزتان و یارمەتیدەر بێت لە ڕێکخستنی کاری ڕۆژانەت',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'RaberB',
                    color: Color.fromARGB(255, 109, 108, 108),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              const Text(
                'بۆ پەیوەندی کردن',
                style: TextStyle(fontFamily: 'RaberB', fontSize: 20),
              ),
              SocialContactDeveloper(instagramIconPath: instagramIconPath),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'شارەزاییم',
                  selectionColor: Color.fromARGB(255, 98, 0, 255),
                  style: TextStyle(fontFamily: 'RaberB', fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      height: 160,
                      width: 160,
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch the $url';
    }
  }

  Widget OwnerAvatar({required String ownerPicturePath}) {
    return Container(
      height: 105,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(ownerPicturePath),
        ),
      ),
    );
  }

  Widget SocialContactDeveloper({required String instagramIconPath}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 65,
            right: 10,
            top: 20,
          ),
          child: IconButton(
            onPressed: () {
              final url = 'https://www.facebook.com/aree.ahmed.311';
              launchUrl(url);
            },
            icon: Icon(
              Icons.facebook,
              color: Color.fromARGB(255, 98, 0, 255),
            ),
            iconSize: 40,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
          ),
          child: IconButton(
            onPressed: () {
              final url = 'https://www.instagram.com/ari_ahmed_ibrahim/';
              launchUrl(url);
            },
            icon: Image.asset(
              instagramIconPath,
              color: Color.fromARGB(255, 98, 0, 255),
              height: 40,
            ),
            iconSize: 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
          ),
          child: IconButton(
            onPressed: () {
              final url =
                  'https://www.youtube.com/channel/UCoLDJpnMno6gA3O4APm7QMQ';
              launchUrl(url);
            },
            icon: FaIcon(
              FontAwesomeIcons.youtube,
              color: Color.fromARGB(255, 98, 0, 255),
            ),
            iconSize: 35,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
          ),
          child: IconButton(
            onPressed: () {
              final url = 'https://github.com/areeahmed';
              launchUrl(url);
            },
            icon: FaIcon(
              FontAwesomeIcons.github,
              color: Color.fromARGB(255, 98, 0, 255),
            ),
            iconSize: 35,
          ),
        )
      ],
    );
  }
}
