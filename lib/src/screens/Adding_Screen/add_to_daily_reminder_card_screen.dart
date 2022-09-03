import 'package:birmbenawa/src/Notifications/notifications.dart';
import 'package:birmbenawa/src/models/Screen/daily_reminder_card_data.dart';
import 'package:birmbenawa/src/models/days_checked_provider.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/image_screens.dart';
import 'package:birmbenawa/src/models/Screen/reminder_card_data.dart';
import 'package:birmbenawa/src/provider/notification_data_prvider.dart';
import 'package:birmbenawa/src/provider/time_provider.dart';
import 'package:birmbenawa/src/widgets/time_picker.dart';
import 'package:custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:day_picker/day_picker.dart';
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
                  ElevatedButton(
                    onPressed: () async {
                      await pickSchedule(context);
                    },
                    child: Text(
                      'Days',
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
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 98, 0, 255),
                        ),
                        onPressed: () {
                          setState(() {
                            NotificationWeekAndTimeRepeated
                                notificationWeekAndTimeRepeated =
                                NotificationWeekAndTimeRepeated(
                              dayOfTheWeek: selectedDay,
                              hour: context.read<TimeProvider>().hour,
                              minute: context.read<TimeProvider>().minute,
                              givenTitle: titleController.text,
                              givenBody: controllerData2.text,
                            );
                            DailyReminderCardData reminderCardData =
                                DailyReminderCardData(
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
}
