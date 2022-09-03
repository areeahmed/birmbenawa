import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageProcess.empty),
              Container(
                height: 100,
                width: 280,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'لە ئێستا دا هیچ بەرنامەیەک بەردەست نییە بەڵام بەم زووانە بەردەست دەبێت',
                    style: TextStyle(fontFamily: 'RaberR', fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
