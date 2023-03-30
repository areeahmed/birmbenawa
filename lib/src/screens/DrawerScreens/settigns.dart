import 'package:auto_size_text/auto_size_text.dart';
import 'package:birmbenawa/src/Notifications/notifications.dart';
import 'package:custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Hive.openBox('user');
  }

  final box = Hive.box('user');
  final String logoPath = 'assets/images/slider/logoNoBackground.png';
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 98, 0, 255)),
        title: Text(
          'Settings',
          style: TextStyle(
              color: Color.fromARGB(255, 98, 0, 255), fontFamily: 'RaberB'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Directionality(
              //     textDirection: TextDirection.rtl,
              //     child: TextFormField(
              //       controller: name,
              //       decoration: InputDecoration(
              //           hintText: '${box.get('name')}',
              //           hintStyle: TextStyle(fontFamily: 'RaberB')),
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(
              //     top: 10,
              //     bottom: 10,
              //   ),
              //   height: 70,
              //   width: 200,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Color.fromARGB(255, 98, 0, 255),
              //     ),
              //     onPressed: () async {
              //       if (name.text == '') {
              //         final snackBar = SnackBar(
              //           content: Directionality(
              //             textDirection: TextDirection.rtl,
              //             child: Text(
              //               'بوورە هیچ داتایەک نییە تاوەکوو بیگۆڕن',
              //               style: TextStyle(fontSize: 24, fontFamily: 'RaberR'),
              //             ),
              //           ),
              //           backgroundColor: Colors.red,
              //         );
              //         ScaffoldMessenger.of(context)
              //           ..removeCurrentMaterialBanner()
              //           ..showSnackBar(snackBar);
              //       } else {
              //         box.put('name', name.text);
              //         final snackBar = SnackBar(
              //           content: Directionality(
              //             textDirection: TextDirection.rtl,
              //             child: Text(
              //               'ناوەکە بە سەرکەوتوویی گۆڕدرا',
              //               style: TextStyle(fontSize: 24, fontFamily: 'RaberR'),
              //             ),
              //           ),
              //           backgroundColor: Colors.green,
              //         );
              //         ScaffoldMessenger.of(context)
              //           ..removeCurrentMaterialBanner()
              //           ..showSnackBar(snackBar);
              //       }
              //     },
              //     child: Text(
              //       'گۆڕینی ناو',
              //       style: TextStyle(fontFamily: 'RaberB', fontSize: 20),
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 100,
              ),
              TextButton(
                onPressed: () {
                  SlideDialog.showSlideDialog(
                    context: context,
                    backgroundColor: Colors.white,
                    pillColor: Colors.yellow,
                    transitionDuration: Duration(milliseconds: 300),
                    child: Container(
                        width: 300,
                        child: Column(
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: AutoSizeText(
                                'ئایا تۆ دڵنیای لە خاوێنکردنەوەی ئەو بەشە، چونکە هیچ کام لە بیرهێنانەوەکانی تێدا نامێنێت.',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'RaberB'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Hive.box('reminderCardDatas').clear();
                                      cancelAllNotification();
                                    },
                                    child: Text('بەڵێ',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 98, 0, 255),
                                            fontSize: 20,
                                            fontFamily: 'RaberB'))),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('نەخێر',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 98, 0, 255),
                                            fontSize: 20,
                                            fontFamily: 'RaberB'))),
                              ],
                            )
                          ],
                        )),
                  );
                },
                child: Text(
                  'لابردنی هەموو ئاگادارکرنەوەکان',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RaberB',
                    color: Color.fromARGB(255, 98, 0, 255),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  SlideDialog.showSlideDialog(
                    context: context,
                    backgroundColor: Colors.white,
                    pillColor: Colors.yellow,
                    transitionDuration: Duration(milliseconds: 300),
                    child: Container(
                        width: 300,
                        child: Column(
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: AutoSizeText(
                                'ئایا تۆ دڵنیای لە خاوێنکردنەوەی ئەو بەشە، چونکە هیچ کام لە بیرهێنانەوەکانی تێدا نامێنێت.',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'RaberR'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Hive.box('todo').clear();
                                    },
                                    child: Text('بەڵێ',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 98, 0, 255),
                                            fontSize: 20,
                                            fontFamily: 'RaberB'))),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('نەخێر',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 98, 0, 255),
                                            fontSize: 20,
                                            fontFamily: 'RaberB'))),
                              ],
                            )
                          ],
                        )),
                  );
                },
                child: Text(
                  'لابردنی هەموو ئەرکەکانم',
                  style: TextStyle(
                    fontFamily: 'RaberB',
                    fontSize: 20,
                    color: Color.fromARGB(255, 98, 0, 255),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  SlideDialog.showSlideDialog(
                    context: context,
                    backgroundColor: Colors.white,
                    pillColor: Colors.yellow,
                    transitionDuration: Duration(milliseconds: 300),
                    child: Container(
                        width: 300,
                        child: Column(
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: AutoSizeText(
                                'ئایا تۆ دڵنیای لە خاوێنکردنەوەی ئەو بەشە، چونکە هیچ کام لە بیرهێنانەوەکانی تێدا نامێنێت.',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'RaberB'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Hive.box('debt').clear();
                                    },
                                    child: Text('بەڵێ',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 98, 0, 255),
                                            fontSize: 20,
                                            fontFamily: 'RaberB'))),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('نەخێر',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 98, 0, 255),
                                            fontSize: 20,
                                            fontFamily: 'RaberB'))),
                              ],
                            )
                          ],
                        )),
                  );
                },
                child: Text(
                  'لابردنی هەموو قەرزەکان',
                  style: TextStyle(
                    fontFamily: 'RaberB',
                    fontSize: 20,
                    color: Color.fromARGB(255, 98, 0, 255),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
