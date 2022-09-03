import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:birmbenawa/src/Notifications/notifications.dart';
import 'package:birmbenawa/src/models/Screen/daily_reminder_card_data.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/screens/Adding_Screen/add_to_daily_reminder_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/adapters.dart';

class DailyReminderPage extends StatefulWidget {
  const DailyReminderPage({Key? key}) : super(key: key);

  @override
  State<DailyReminderPage> createState() => _DailyReminderPageState();
}

class _DailyReminderPageState extends State<DailyReminderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
          if (!isAllowed)
            {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'ڕێگەپێدان بە هاتنی ئاگادارکەرەوە',
                    style: TextStyle(
                      fontFamily: 'RaberB',
                    ),
                  ),
                  content: Text(
                    'بەرنامەکەی ئێمە داوای ڕێگەپێدان دەکات تاوەکو ئاگادارکەرەوەت بۆ بنێرێت',
                    style: TextStyle(
                      fontFamily: 'RaberB',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'نەخێر، ڕێگەنادەم',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'RaberB',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        AwesomeNotifications()
                            .requestPermissionToSendNotifications()
                            .then((_) => Navigator.pop(context));
                      },
                      child: Text(
                        'بەڵێ، ڕێگە دەدەم',
                        style: TextStyle(
                          color: Color.fromARGB(255, 98, 0, 255),
                          fontFamily: 'RaberB',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            }
        });

    //this will be show the snackbar that tell the user that the notification has been created
    // AwesomeNotifications().createdStream.listen((notification) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(
    //         '',
    //       ),
    //     ),
    //   );
    // });

    // when the notification come there will be some action to navigate the current screen
    // AwesomeNotifications().actionStream.listen((notification) {
    // this if will check if the platform is IOS if it was so should the bag decremented by 1
    //   if (notification.channelKey == 'basic_channel' && Platform.isIOS) {
    //     AwesomeNotifications().getGlobalBadgeCounter().then(
    //           (value) =>
    //               AwesomeNotifications().setGlobalBadgeCounter(value - 1),
    //         );
    //   }
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(builder: (_) => Reminderpage()),
    //       (route) => route.isFirst);
    // });
  }

  bool isChecked = false;
  ImageProcess imageProcess = ImageProcess();
  @override
  Widget build(BuildContext context) {
    Hive.openBox('dailyReminderCardDatas');
    return Scaffold(
        body: ValueListenableBuilder<Box>(
          valueListenable: Hive.box('dailyReminderCardDatas').listenable(),
          builder: ((context, box, Widget) {
            List<int> keys = box.keys.cast<int>().toList();
            return box.isEmpty
                ? SingleChildScrollView(
                    reverse: true,
                    child: Container(
                      color: Colors.white,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(imageProcess.empty),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 25),
                            child: Text(
                              'ئەم بەشە بەتاڵە لە ئێستا دا',
                              style:
                                  TextStyle(fontFamily: 'RaberB', fontSize: 20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: Transform.rotate(
                              angle: 6.6,
                              child: Image.asset(
                                'assets/images/arrow.png',
                                height: 180,
                                fit: BoxFit.cover,
                                scale: 7,
                                opacity: AlwaysStoppedAnimation(200),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  )
                : Center(
                    child: ListView.builder(
                      itemCount: box.length,
                      itemBuilder: ((context, index) {
                        final key = keys[index];
                        Map<dynamic, dynamic> _data = box.getAt(index);
                        DailyReminderCardData dailyReminderCardData =
                            DailyReminderCardData.fromMap(
                                _data as Map<dynamic, dynamic>);
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  box.delete(key);
                                  cancelNotification(
                                      id: dailyReminderCardData
                                          .notificationId!);
                                },
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                              )
                            ],
                          ),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 10),
                              width: 450,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${dailyReminderCardData.hour}:${dailyReminderCardData.minute}',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: 'RaberB',
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          dailyReminderCardData.title,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'RaberB',
                                          ),
                                        ),
                                      ),
                                      Switch.adaptive(
                                          activeColor:
                                              Color.fromARGB(255, 98, 0, 255),
                                          inactiveThumbColor:
                                              Color.fromARGB(255, 155, 98, 248),
                                          inactiveTrackColor: Color.fromARGB(
                                              255, 201, 167, 255),
                                          value: _data[key] ?? true,
                                          onChanged: (value) {
                                            setState(() {
                                              if (_data[key] == null) {
                                                _data[key] = true;
                                              }
                                              _data[key] = !_data[key];
                                              if (_data[key] == true) {
                                                NotificationWeekAndTimeRepeated
                                                    notificationWeekAndTimeRepeated =
                                                    NotificationWeekAndTimeRepeated(
                                                  id: dailyReminderCardData
                                                      .notificationId,
                                                  dayOfTheWeek:
                                                      dailyReminderCardData
                                                          .dayOfWeek,
                                                  hour: dailyReminderCardData
                                                      .hour,
                                                  minute: dailyReminderCardData
                                                      .minute,
                                                  givenTitle:
                                                      dailyReminderCardData
                                                          .title,
                                                  givenBody:
                                                      dailyReminderCardData
                                                          .descriptionOfCard,
                                                );
                                                createDailyScheduledNotification(
                                                    notificationWeekAndTimeRepeated);
                                              } else if (_data[key] == false) {
                                                cancelNotification(
                                                    id: dailyReminderCardData
                                                        .notificationId!);
                                              }
                                            });
                                          }),
                                    ],
                                  ),
                                ],
                              )),
                        );
                      }),
                    ),
                  );
          }),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(FontAwesomeIcons.calendarDays),
            heroTag: 'fab2',
            backgroundColor: const Color.fromARGB(255, 98, 0, 255),
            onPressed: () {
              // cancelAllNotification();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditDailyReminderCardScreen(),
              ));
            }));
  }
}
