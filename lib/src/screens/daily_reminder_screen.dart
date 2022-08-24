import 'package:birmbenawa/src/models/Screen/daily_reminder_card_data.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/provider/daily_remider_model.dart';
import 'package:birmbenawa/src/provider/used_too_mutch.dart';
import 'package:birmbenawa/src/screens/Edit/edit_daily_reminder_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class DailyReminderPage extends StatefulWidget {
  const DailyReminderPage({Key? key}) : super(key: key);

  @override
  State<DailyReminderPage> createState() => _DailyReminderPageState();
}

class _DailyReminderPageState extends State<DailyReminderPage> {
  // transferred dialogBody = transferred(isDailyReminder: true);
  DailyReminderScreenModel dailyReminderCard = DailyReminderScreenModel();
  ImageProcess imageProcess = ImageProcess();
  UsedTooMutch userTooMutch = UsedTooMutch();
  @override
  Widget build(BuildContext context) {
    Hive.openBox('dailyReminderCardDatas');
    return Scaffold(
        body: ValueListenableBuilder<Box>(
          valueListenable: Hive.box('dailyReminderCardDatas')
              .listenable(), //! ERROR: Box not found. Did you forget to call Hive.openBox()?
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
                        DailyReminderCardData reminderCardData =
                            DailyReminderCardData.fromMap(
                                _data as Map<dynamic, dynamic>);
                        return Container(
                          child: Column(
                            textDirection: TextDirection.rtl,
                            children: [
                              Container(
                                color: reminderCardData.color,
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
                                  Icon(
                                    reminderCardData.icon,
                                    size: 60,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(reminderCardData.sat == true
                                      ? 'sat'
                                      : ''),
                                  SizedBox(width: 3),
                                  Text(reminderCardData.sun == true
                                      ? 'sun'
                                      : ''),
                                  SizedBox(width: 3),
                                  Text(reminderCardData.mon == true
                                      ? 'mon'
                                      : ''),
                                  SizedBox(width: 3),
                                  Text(reminderCardData.tue == true
                                      ? 'tue'
                                      : ' '),
                                  SizedBox(width: 3),
                                  Text(reminderCardData.wed == true
                                      ? 'wed'
                                      : ' '),
                                  SizedBox(width: 3),
                                  Text(reminderCardData.thr == true
                                      ? 'thr'
                                      : ' '),
                                  SizedBox(width: 3),
                                  Text(reminderCardData.fri == true
                                      ? 'fri'
                                      : ' '),
                                  SizedBox(width: 3),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        //TODO: How to make the Key will be incremented automatically
                                        box.delete('1');
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  );
          }),
        ),
        // ReminderCardData remidnerCardData = Rem
        //* Appbar ( LogoIcon - NameOfPageText - DarwerIcon)

        //* Text for greeting the user ( Hello Name of the user that we get from << RegisterPage >>)

        //* ListViewBuilder ==> Showing the cards that user will create and the screen show ( No Card is Created if the list was empty )

        //* Button Action to create a Card

        //* Cards contains ==> ( Title - Description - Time - Icon - color - remining time for reminding)
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            heroTag: 'fab2',
            backgroundColor: const Color.fromARGB(255, 98, 0, 255),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditDailyReminderCardScreen(),
              ));
            }));
  }
}
