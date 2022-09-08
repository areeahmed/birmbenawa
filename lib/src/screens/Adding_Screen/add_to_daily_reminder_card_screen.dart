import 'package:birmbenawa/src/Notifications/notifications.dart';
import 'package:birmbenawa/src/models/Screen/daily_reminder_card_data.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/image_screens.dart';
import 'package:birmbenawa/src/provider/time_provider.dart';
import 'package:birmbenawa/src/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class EditDailyReminderCardScreen extends StatefulWidget {
  EditDailyReminderCardScreen({
    Key? key,
  })
  //required this.isDailyReminder
  : super(key: key);

  @override
  State<EditDailyReminderCardScreen> createState() =>
      _EditDailyReminderCardScreenState();
}

class _EditDailyReminderCardScreenState
    extends State<EditDailyReminderCardScreen> {
  List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];
  int selectedDay = 0;
  bool isDailyReminder = true;
  @override
  ImageProcess process = ImageProcess();
  ImageScreen imageScreen = ImageScreen();
  TextEditingController titleController = TextEditingController();
  TextEditingController controllerData2 = TextEditingController();
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    Color selectedColor = Colors.grey.shade100;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 98, 0, 255),
          title: Text(
            'دانانی ئاگادارکردنەوەی ڕۆژانە',
            style: TextStyle(fontFamily: 'RaberR'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              currentFocus.unfocus();
            },
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      right: 18,
                      bottom: 12,
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: 'RaberB',
                          fontSize: 20,
                        ),
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: 'ناونیشان',
                          suffix: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              titleController.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      right: 18,
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        style: TextStyle(fontFamily: 'RaberB'),
                        textDirection: TextDirection.rtl,
                        controller: controllerData2,
                        decoration: InputDecoration(
                          hintText: 'زانیاری زیاتر',
                          suffix: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              controllerData2.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 12,
                        ),
                        child: TimePicker(),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 98, 0, 255),
                      ),
                      onPressed: () async {
                        await pickSchedule(context);
                      },
                      child: Text(
                        'ڕۆژەکان',
                        style: TextStyle(
                          fontFamily: 'RaberB',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 98, 0, 255),
                        ),
                        onPressed: () {
                          setState(() {
                            if (titleController.text == '') {
                              final snackBar = SnackBar(
                                duration: Duration(milliseconds: 800),
                                content: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    'خانەکان بە دروستی پڕبکەوە تکایە',
                                    style: TextStyle(
                                        fontSize: 24, fontFamily: 'RaberR'),
                                  ),
                                ),
                                backgroundColor: Colors.red,
                              );
                              // showing snackbar at the bottom of the screen.
                              ScaffoldMessenger.of(context)
                                ..removeCurrentMaterialBanner()
                                ..showSnackBar(snackBar);
                            } else {
                              final snackBar = SnackBar(
                                duration: Duration(milliseconds: 800),
                                content: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    'جێبەجێکرا',
                                    style: TextStyle(
                                        fontSize: 24, fontFamily: 'RaberR'),
                                  ),
                                ),
                                backgroundColor: Colors.green,
                              );
                              // showing snackbar at the bottom of the screen.
                              ScaffoldMessenger.of(context)
                                ..removeCurrentMaterialBanner()
                                ..showSnackBar(snackBar);
                              NotificationWeekAndTimeRepeated
                                  notificationWeekAndTimeRepeated =
                                  NotificationWeekAndTimeRepeated(
                                id: createUniqueId(),
                                dayOfTheWeek: selectedDay,
                                hour: context.read<TimeProvider>().hour,
                                minute: context.read<TimeProvider>().minute,
                                givenTitle: titleController.text,
                                givenBody: controllerData2.text,
                              );
                              DailyReminderCardData reminderCardData =
                                  DailyReminderCardData(
                                notificationId: createUniqueId(),
                                title: titleController.text,
                                descriptionOfCard: controllerData2.text,
                                hour: context.read<TimeProvider>().hour,
                                minute: context.read<TimeProvider>().minute,
                                pmOrAm: context.read<TimeProvider>().pmOrAm,
                                dayOfWeek: selectedDay,
                              );
                              createDailyScheduledNotification(
                                  notificationWeekAndTimeRepeated);
                              final box = Hive.box('dailyReminderCardDatas');
                              box.add(reminderCardData.toMap());
                              Navigator.of(context).pop();
                            }
                          });
                        },
                        child: Text(
                          'خەزن کردن',
                          style: TextStyle(fontFamily: 'RaberB', fontSize: 20),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future<int?> pickSchedule(
    BuildContext context,
  ) async {
    TimeOfDay? timeOfDay;
    DateTime now = DateTime.now();

    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'ڕۆژێک هەڵبژێرە',
              textAlign: TextAlign.center,
            ),
            content: Wrap(
              alignment: WrapAlignment.center,
              spacing: 3,
              children: [
                for (int index = 0; index < weekdays.length; index++)
                  ElevatedButton(
                    onPressed: () {
                      selectedDay = index + 1;

                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 98, 0, 255),
                      ),
                    ),
                    child: Text(
                      weekdays[index],
                    ),
                  ),
              ],
            ),
          );
        });
  }

  int createUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(5.remainder(3));
  }
}
