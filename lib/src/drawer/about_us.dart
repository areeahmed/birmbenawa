import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* circle image
              Container(
                height: 105,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ownerPicturePath),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              //* name
              Text(
                //
                textDirection: TextDirection.rtl,
                'ئاری احمد ابراهیم',
                style: TextStyle(fontSize: 20, fontFamily: 'KurdBold'),
              ),
              //* description
              SizedBox(
                height: 35,
              ),
              Text(
                textDirection: TextDirection.rtl,
                'خوێندکار لە زانکۆی سەڵاحەدین کۆلێژی زانست بەشی ئایتی',
                style: TextStyle(fontSize: 16, fontFamily: 'KurdBold'),
              ),
              //* messege
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Text(
                  textDirection: TextDirection.rtl,
                  'سڵاو بەکارهێنەری خۆشەویست، هیوادارم ئەم بەرنامەیەی منت بە دڵ بێت، سوودی زۆری هەبێت بۆ بەڕێزتان و یارمەتیدەر بێت لە ڕێکخستنی کاری ڕۆژانەت',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'KurdBold',
                    color: Colors.grey,
                  ),
                ),
              ),
              //* text contact
              SizedBox(
                height: 70,
              ),
              Text(
                'بۆ پەیوەندی کردن',
                style: TextStyle(fontFamily: 'KurdBold', fontSize: 16),
              ),
              //* contact icon

              Row(
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
                      icon: Icon(Icons.facebook),
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
                        final url =
                            'https://www.instagram.com/ari_ahmed_ibrahim/';
                        launchUrl(url);
                      },
                      icon: Image.asset(
                        instagramIconPath,
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
                      icon: FaIcon(FontAwesomeIcons.youtube),
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
                      icon: FaIcon(FontAwesomeIcons.github),
                      iconSize: 35,
                    ),
                  )
                ],
              ),
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
}
