import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:birmbenawa/src/models/Screen/daily_reminder_card_data.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/provider/used_too_mutch.dart';
import 'package:birmbenawa/src/screens/Adding_Screen/add_to_daily_reminder_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class DailyReminderPage extends StatefulWidget {
  const DailyReminderPage({Key? key}) : super(key: key);

  @override
  State<DailyReminderPage> createState() => _DailyReminderPageState();
}

class _DailyReminderPageState extends State<DailyReminderPage> {
  bool isChecked = false;
  ImageProcess imageProcess = ImageProcess();
  UsedTooMutch userTooMutch = UsedTooMutch();
  @override
  Widget build(BuildContext context) {
    Hive.openBox('dailyReminderCardDatas');
    return Scaffold(
        body: ValueListenableBuilder<Box>(
          valueListenable: Hive.box('dailyReminderCardDatas').listenable(),
          builder: ((context, box, Widget) {
            List<int> keys = box.keys
                .cast<int>()
                .toList(); //! ERROR: type 'String' is not a subtype of type 'int' in type cast
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
                        DailyReminderCardData dailyReminderCardData =
                            DailyReminderCardData.fromMap(
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
                                      dailyReminderCardData.title,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Switch.adaptive(
                                        activeColor:
                                            Color.fromARGB(255, 98, 0, 255),
                                        inactiveThumbColor:
                                            Color.fromARGB(255, 155, 98, 248),
                                        inactiveTrackColor:
                                            Color.fromARGB(255, 201, 167, 255),
                                        value: isChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            isChecked = !isChecked;
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
                                        color: Colors.grey.shade400,
                                      ),
                                      width: 300,
                                      height: 70,
                                      child: AutoSizeText(
                                        dailyReminderCardData.descriptionOfCard,
                                        style: TextStyle(fontSize: 20),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // Row(
                                //   children: [
                                //     Text(
                                //       'Mon-Fri',
                                //       style: TextStyle(fontSize: 16),
                                //     ),
                                //   ],
                                // ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${dailyReminderCardData.houre}:${dailyReminderCardData.minute}',
                                      style: TextStyle(fontSize: 40),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showAdaptiveActionSheet(
                                            context: context,
                                            title: Text('Card Number $key'),
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
                                                title: const Text(
                                                    'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
                                          );
                                        },
                                        icon: Icon(Icons.arrow_circle_down))
                                  ],
                                )
                              ],
                            ));
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
              // Hive.box('dailyReminderCardDatas').clear();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditDailyReminderCardScreen(),
              ));
            }));
  }
}
