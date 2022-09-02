import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:birmbenawa/src/Notifications/notifications.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/Screen/reminder_card_data.dart';
import 'package:birmbenawa/src/screens/Adding_Screen/add_to_remider_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Reminderpage extends StatefulWidget {
  Reminderpage({Key? key}) : super(key: key);
  @override
  State<Reminderpage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<Reminderpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
          // requesting a permission from user to allow the app send to his/her notification
          // if the notification was not allowed for the app so this dialog will be shown.
          // this dialog tell the user that our app would like to send notifications to you.
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
                        // here we don't need the value so we just added under score
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

  // this to dispose the notification streams
  // @override
  // void dispose() {
  //   AwesomeNotifications().actionSink.close();
  //   AwesomeNotifications().createdSink.close();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  ImageProcess imageProcess = ImageProcess();
  @override
  Widget build(BuildContext context) {
    // final cardDataBox = Hive.box('reminderCardDatas');
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ValueListenableBuilder<Box>(
          valueListenable: Hive.box('reminderCardDatas').listenable(),
          builder: ((context, box, Widget) {
            List keys = box.keys.cast<int>().toList();
            return box.isEmpty
                ? SingleChildScrollView(
                    reverse: true,
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
                  )
                : Center(
                    child: ListView.builder(
                      itemCount: box.length,
                      itemBuilder: ((context, index) {
                        final key = keys[index];
                        Map<dynamic, dynamic> _data = box.getAt(index);
                        ReminderCardData reminderCardData =
                            ReminderCardData.fromMap(
                                _data as Map<dynamic, dynamic>);

                        return Slidable(
                          endActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  box.delete(key);
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
                                      '${reminderCardData.houre.toString().padLeft(2, '0')}:${reminderCardData.minute.toString().padLeft(2, '0')}',
                                      style: TextStyle(
                                          fontSize: 30, fontFamily: 'RaberB'),
                                    ),
                                    Container(
                                      child: Text(
                                        reminderCardData.title,
                                        style: TextStyle(
                                            fontSize: 22, fontFamily: 'RaberB'),
                                      ),
                                    ),
                                    Switch.adaptive(
                                        activeColor:
                                            Color.fromARGB(255, 98, 0, 255),
                                        inactiveThumbColor:
                                            Color.fromARGB(255, 155, 98, 248),
                                        inactiveTrackColor:
                                            Color.fromARGB(255, 201, 167, 255),
                                        value: _data[key] ?? true,
                                        onChanged: (value) {
                                          setState(() {
                                            if (_data[key] == null) {
                                              _data[key] = true;
                                            }
                                            _data[key] = !_data[key];
                                            NotificationWeekAndTime
                                                notificationWeekAndTime =
                                                NotificationWeekAndTime(
                                              year: reminderCardData.year,
                                              month: reminderCardData.month,
                                              day: reminderCardData.day,
                                              hour: reminderCardData.houre,
                                              minute: reminderCardData.minute,
                                              givenTitle:
                                                  reminderCardData.title,
                                              givenBody: reminderCardData
                                                  .descriptionOfCard,
                                            );
                                            createSpecificScheduledNotification(
                                              notificationWeekAndTime,
                                            );
                                          });
                                        })
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Date: ${reminderCardData.day} / ${reminderCardData.month} / ${reminderCardData.year}',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab1',
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
        onPressed: () {
          //TODO it should show the notification
          // createNotification(
          //     givenTitle: 'App Developer', givenBody: 'Hello Sir');
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => EditReminderCardScreen())));
        },
        child: const Icon(Icons.notification_add),
      ),
    );
  }
}
