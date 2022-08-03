import 'package:birmbenawa/src/models/reminder_screen_model.dart';
import 'package:flutter/material.dart';

class ReminderCardWidget extends StatefulWidget {
  String? time; //! requeared
  bool? pm; //! requeared
  bool? am; //! requeared
  String? title;
  Icon? icon;
  Color? cardColor;
  ReminderCardWidget({
    Key? key,
    this.time, //! requeared
    this.am, //! requeared
    this.pm, //! requeared
    this.title,
    this.icon,
    this.cardColor,
  }) : super(key: key);

  @override
  State<ReminderCardWidget> createState() => _reminderCardWidgetState(
        time: time,
        pm: pm,
        am: am,
        title: title,
        icon: icon,
      );
}

class _reminderCardWidgetState extends State<ReminderCardWidget> {
  String? time; //! requeared
  bool? pm; //! requeared
  bool? am; //! requeared
  String? title;
  Icon? icon;
  _reminderCardWidgetState({
    this.time, //! requeared
    this.am, //! requeared
    this.pm, //! requeared
    this.title,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    ReminderScreenModel reminderScreenComponentModel = ReminderScreenModel();
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(8),
              height: 133,
              width: 376,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(110, 8, 20, 10),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Title',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'More Detail',
                            ),
                          ],
                        ),
                      ),
                      //! Time Column
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 30, 0, 20),
                            child: Column(
                              children: const [
                                Text(
                                  '12:12',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'PM',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
