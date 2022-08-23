import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/reminder_card_data.dart';
import 'package:birmbenawa/src/provider/dialog_component_model.dart';
import 'package:birmbenawa/src/provider/navigating_between_screens.dart';
import 'package:birmbenawa/src/provider/reminder_screen_models.dart';
import 'package:birmbenawa/src/provider/used_too_mutch.dart';
import 'package:birmbenawa/src/screens/edit_remider_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Reminderpage extends StatefulWidget {
  String? titleOfTheCard;
  String? selectedTime;
  int? timeH;
  int? timeM;
  Reminderpage({
    Key? key,
    this.titleOfTheCard,
    this.selectedTime,
    this.timeH,
    this.timeM,
  }) : super(key: key);
  @override
  State<Reminderpage> createState() => _ReminderPageState(
        titleOfTheCard: titleOfTheCard,
        selectedTime: selectedTime,
        timeH: timeH,
        timeM: timeM,
      );
}

class _ReminderPageState extends State<Reminderpage> {
  NaviagtingBetweenScreens navigateBetweenScreens = NaviagtingBetweenScreens();
  _ReminderPageState({
    required this.titleOfTheCard,
    required this.selectedTime,
    required this.timeH,
    required this.timeM,
  });

  ImageProcess imageProcess = ImageProcess();
  UsedTooMutch usedTooMutch = UsedTooMutch();
  String? titleOfTheCard;
  String? selectedTime;
  IconData? icon;
  int? timeH;
  int? timeM;
  // transferred dialogComponentModelWidgets = transferred(isDailyReminder: false);
  @override
  Widget build(BuildContext context) {
    // final cardDataBox = Hive.box('reminderCardDatas');
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           if (cardDataBox.isEmpty) {
      //             print('Box is empty');
      //           } else {
      //             cardDataBox.clear();
      //           }
      //         },
      //         icon: Icon(Icons.clear))
      //   ],
      // ),
      //TODO use the segment of code for showing cards from hive database
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box('reminderCardDatas').listenable(),
        builder: ((context, box, Widget) {
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
                        Map<dynamic, dynamic> _data = box.getAt(index);
                        ReminderCardData reminderCardData =
                            ReminderCardData.fromMap(
                                _data as Map<dynamic, dynamic>);
                        return Container(
                          child: Column(
                            textDirection: TextDirection.rtl,
                            children: [
                              Container(
                                child: Text(
                                  reminderCardData.title,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: 'PeshangBold'),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${reminderCardData.houre}:${reminderCardData.minute}',
                                  ),
                                  Text(reminderCardData.descriptionOfCard),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        box.delete('1');
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              )
                            ],
                          ),
                        );

                        // ListTile(
                        //   title: Text(reminderCardData.title),
                        //   leading: Icon(reminderCardData.icon),
                        //   trailing: IconButton(
                        //     icon: Icon(Icons.delete),
                        //     onPressed: () {
                        //       box.delete('1');
                        //     },
                        //   ),
                        // trailing: Text(
                        //     '${reminderCardData.houre}:${reminderCardData.minute}'),
                        // );
                      })),
                );
        }),
      ),

      // body: SingleChildScrollView(
      //   reverse: true,
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         SizedBox(
      //           height: 60,
      //         ),
      //         ReminderScreenModel(),
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab1',
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => EditReminderCardScreen()))),
        child: const Icon(Icons.add),
      ),
    );
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   Hive.close();
  //   super.dispose();
  // }
}
