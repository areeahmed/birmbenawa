import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsPage extends StatelessWidget {
  final String logoPath = 'assets/images/slider/logo.png';
  const AboutUsPage({Key? key}) : super(key: key);

//* this screen is for information about developer of the application and his social media
  @override
  Widget build(BuildContext context) {
    final url = Uri.decodeComponent('https://www.facebook.com/aree.ahmed.311');
    String instagramIconPath = 'assets/icons/favicon.ico';
    String ownerPicturePath = 'assets/images/AriAhmedPic.png';
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          logoPath,
          width: 50,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* circle image
              OwnerAvatar(ownerPicturePath: ownerPicturePath),
              const SizedBox(height: 35),
              //* name
              Text(
                //
                textDirection: TextDirection.rtl,
                'ئاری احمد ابراهیم',
                style: TextStyle(fontSize: 20, fontFamily: 'PeshangBold'),
              ),
              //* description
              const SizedBox(height: 35),
              Text(
                textDirection: TextDirection.rtl,
                'خوێندکارم لە زانکۆی سەڵاحەدین کۆلێژی زانست بەشی ئایتی',
                style: TextStyle(fontSize: 14, fontFamily: 'PeshangBold'),
              ),
              //* messege
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Text(
                  textDirection: TextDirection.rtl,
                  'سڵاو بەکارهێنەری خۆشەویست، هیوادارم ئەم بەرنامەیەی منت بە دڵ بێت، سوودی زۆری هەبێت بۆ بەڕێزتان و یارمەتیدەر بێت لە ڕێکخستنی کاری ڕۆژانەت',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'PeshangBold',
                    color: Color.fromARGB(255, 109, 108, 108),
                  ),
                ),
              ),
              //* text contact
              const SizedBox(height: 70),
              const Text(
                'بۆ پەیوەندی کردن',
                style: TextStyle(fontFamily: 'PeshangBold', fontSize: 16),
              ),
              //* contact icon
              SocialContactDeveloper(instagramIconPath: instagramIconPath),
              //* goback button
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
              color: Colors.blue,
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
              // https://www.instagram.com/ari_ahmed_ibrahim/
              final url = 'https://www.instagram.com/ari_ahmed_ibrahim/';
              launchUrl(url);
            },
            icon: Image.asset(
              instagramIconPath,
              color: Color.fromARGB(255, 255, 0, 157),
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
              color: Colors.red,
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
