import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OtherAppsPage extends StatelessWidget {
  final String logoPath = 'assets/images/slider/logoNoBackground.png';
  const OtherAppsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProcess imageProcess = ImageProcess();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 98, 0, 255)),
        title: Text(
          'Other Apps',
          style: TextStyle(color: Color.fromARGB(255, 98, 0, 255)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imageProcess.empty),
                Container(
                  height: 70,
                  width: 280,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      'لە ئێستا دا هیچ بەرنامەیەک بەردەست نییە بەڵام بەم زووانە بەردەست دەبێت',
                      style: TextStyle(fontFamily: 'RaberR', fontSize: 18),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 79,
                      width: 280,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          'بۆ ئەوەی ئاگاداری کار و چالاکیەکانمان بیت سەردانی سۆشیاڵ میدیاکانمان بکە',
                          style: TextStyle(fontFamily: 'RaberR', fontSize: 18),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'سۆشیاڵمێدیاکانمان: ',
                          style: TextStyle(fontFamily: 'RaberB', fontSize: 20),
                        ),
                        IconButton(
                          onPressed: () {
                            final url = 'https://linktr.ee/birmbenawa';
                            launchUrl(url);
                          },
                          icon: Icon(
                            Icons.link,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
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
