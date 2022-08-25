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
  final String logoPath = 'assets/images/slider/logo.png';
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(hintText: '${box.get('name')}'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              box.put('name', name.text);
              Get.snackbar('ناو گۆڕین', 'ناو گۆڕینەکە سەرکەوتوو بوو');
            },
            child: Text('Edit'),
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
                                fontSize: 20, fontFamily: 'PeshangBold'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Hive.box('reminderCardDatas').clear();
                                },
                                child: Text('بەڵێ')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('نەخێر')),
                          ],
                        )
                      ],
                    )),
              );
            },
            child: Text('Clear All Today Reminder'),
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
                                fontSize: 20, fontFamily: 'PeshangBold'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Hive.box('dailyReminderCardDatas').clear();
                                },
                                child: Text('بەڵێ')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('نەخێر')),
                          ],
                        )
                      ],
                    )),
              );
            },
            child: Text('Clear All Daily Reminder'),
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
                                fontSize: 20, fontFamily: 'PeshangBold'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Hive.box('todo').clear();
                                },
                                child: Text('بەڵێ')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('نەخێر')),
                          ],
                        )
                      ],
                    )),
              );
            },
            child: Text('Clear All TODO'),
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
                                fontSize: 20, fontFamily: 'PeshangBold'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Hive.box('debt').clear();
                                },
                                child: Text('بەڵێ')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('نەخێر')),
                          ],
                        )
                      ],
                    )),
              );
            },
            child: Text('Clear All Debt'),
          )
        ],
      ),
    );
  }
}
