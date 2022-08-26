import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/Screen/reminder_card_data.dart';
import 'package:birmbenawa/src/provider/navigating_between_screens.dart';
import 'package:birmbenawa/src/provider/used_too_mutch.dart';
import 'package:birmbenawa/src/screens/Adding_Screen/add_to_remider_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Reminderpage extends StatefulWidget {
  Reminderpage({Key? key}) : super(key: key);
  @override
  State<Reminderpage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<Reminderpage> {
  NaviagtingBetweenScreens navigateBetweenScreens = NaviagtingBetweenScreens();
  ImageProcess imageProcess = ImageProcess();
  UsedTooMutch usedTooMutch = UsedTooMutch();

  // transferred dialogComponentModelWidgets = transferred(isDailyReminder: false);
  @override
  Widget build(BuildContext context) {
    // final cardDataBox = Hive.box('reminderCardDatas');
    return Scaffold(
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box('reminderCardDatas').listenable(),
        builder: ((context, box, Widget) {
          List keys = box.keys.cast<int>().toList();
          return box.isEmpty
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imageProcess.empty),
                    SizedBox(
                      height: 12,
                    ),
                    Text('Screen is Empty')
                  ],
                ))
              : Center(
                  child: ListView.builder(
                      itemCount: box.length,
                      itemBuilder: ((context, index) {
                        final key = keys[index];
                        Map<dynamic, dynamic> _data = box.getAt(index);
                        ReminderCardData reminderCardData =
                            ReminderCardData.fromMap(
                                _data as Map<dynamic, dynamic>);
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade300,
                            ),
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(20),
                            width: 400,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.label,
                                      size: 40,
                                      color: Color.fromARGB(255, 98, 0, 255),
                                    ),
                                    Text(
                                      reminderCardData.title,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Switch.adaptive(
                                        activeColor:
                                            Color.fromARGB(255, 98, 0, 255),
                                        inactiveThumbColor:
                                            Color.fromARGB(255, 155, 98, 248),
                                        inactiveTrackColor:
                                            Color.fromARGB(255, 201, 167, 255),
                                        value: _data[key] ?? false,
                                        onChanged: (value) {
                                          setState(() {
                                            if (_data[key] == null) {
                                              _data[key] = true;
                                            }
                                            _data[key] = !_data[key];
                                          });
                                        })
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.grey.shade100,
                                      ),
                                      width: 300,
                                      height: 70,
                                      child: AutoSizeText(
                                        reminderCardData.descriptionOfCard,
                                        style: TextStyle(fontSize: 20),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${reminderCardData.houre}:${reminderCardData.minute}',
                                      style: TextStyle(fontSize: 40),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showAdaptiveActionSheet(
                                            context: context,
                                            title:
                                                Text('Card Number ${key + 1}'),
                                            androidBorderRadius: 30,
                                            actions: <BottomSheetAction>[
                                              BottomSheetAction(
                                                  title: Text('Delete'),
                                                  onPressed: (context) {
                                                    box.delete(key);
                                                    Navigator.of(context).pop();
                                                  }),
                                            ],
                                            cancelAction: CancelAction(
                                                title: const Text('Cancel')),
                                          );
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                )
                              ],
                            ));
                      })),
                );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab1',
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => EditReminderCardScreen()))),
        child: const Icon(Icons.add),
      ),
    );
  }
}
