import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

//TODO adding 2 setting here 1 - app setting 2- profile setting
//* this is for settigns screen not builded yet
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    hintText: '${box.get('name')}',
                    hintStyle: TextStyle(fontFamily: 'RaberB')),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 98, 0, 255),
            ),
            onPressed: () async {
              if (name.text == '') {
                final snackBar = SnackBar(
                  content: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      'بوورە هیچ داتایەک نییە تاوەکوو بیگۆڕن',
                      style: TextStyle(fontSize: 24, fontFamily: 'RaberR'),
                    ),
                  ),
                  backgroundColor: Colors.red,
                );
                // showing snackbar at the bottom of the screen.
                ScaffoldMessenger.of(context)
                  ..removeCurrentMaterialBanner()
                  ..showSnackBar(snackBar);
              } else {
                box.put('name', name.text);
                final snackBar = SnackBar(
                  content: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      'ناوەکە بە سەرکەوتوویی گۆڕدرا',
                      style: TextStyle(fontSize: 24, fontFamily: 'RaberR'),
                    ),
                  ),
                  backgroundColor: Colors.green,
                );
                // showing snackbar at the bottom of the screen.
                ScaffoldMessenger.of(context)
                  ..removeCurrentMaterialBanner()
                  ..showSnackBar(snackBar);
              }
            },
            child: Text(
              'گۆڕین',
              style: TextStyle(fontFamily: 'RaberB'),
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
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'RaberB'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Hive.box('reminderCardDatas').clear();
                                },
                                child: Text('بەڵێ',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 98, 0, 255),
                                        fontSize: 20,
                                        fontFamily: 'RaberB'))),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('نەخێر',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 98, 0, 255),
                                        fontSize: 20,
                                        fontFamily: 'RaberB'))),
                          ],
                        )
                      ],
                    )),
              );
            },
            child: Text(
              'Clear All Today Reminder',
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
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'RaberB'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Hive.box('dailyReminderCardDatas').clear();
                                },
                                child: Text(
                                  'بەڵێ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 98, 0, 255),
                                      fontSize: 20,
                                      fontFamily: 'RaberB'),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('نەخێر',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 98, 0, 255),
                                        fontSize: 20,
                                        fontFamily: 'RaberB'))),
                          ],
                        )
                      ],
                    )),
              );
            },
            child: Text(
              'Clear All Daily Reminder',
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
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'RaberR'),
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
                                        color: Color.fromARGB(255, 98, 0, 255),
                                        fontSize: 20,
                                        fontFamily: 'RaberB'))),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('نەخێر',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 98, 0, 255),
                                        fontSize: 20,
                                        fontFamily: 'RaberB'))),
                          ],
                        )
                      ],
                    )),
              );
            },
            child: Text(
              'Clear All TODO',
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
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'RaberB'),
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
                                        color: Color.fromARGB(255, 98, 0, 255),
                                        fontSize: 20,
                                        fontFamily: 'RaberB'))),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('نەخێر',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 98, 0, 255),
                                        fontSize: 20,
                                        fontFamily: 'RaberB'))),
                          ],
                        )
                      ],
                    )),
              );
            },
            child: Text(
              'Clear All Debt',
              style: TextStyle(
                fontFamily: 'RaberB',
                fontSize: 20,
                color: Color.fromARGB(255, 98, 0, 255),
              ),
            ),
          )
        ],
      ),
    );
  }
}
