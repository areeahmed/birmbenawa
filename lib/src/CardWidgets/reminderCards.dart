import 'package:flutter/material.dart';

class ReminderCardPage extends StatefulWidget {
  Icon selectedIcon;
  String theTitleOfTheCard;
  int selectedTime;
  int timeH;
  int timeM;
  ReminderCardPage(
      {Key? key,
      required this.timeH,
      required this.timeM,
      required this.selectedIcon,
      required this.selectedTime,
      required this.theTitleOfTheCard})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ReminderCardPage> createState() => _ReminderCardPageState(
        timeH: timeH,
        timeM: timeM,
        selectedIcon: selectedIcon,
        theTitleOfTheCard: theTitleOfTheCard,
        selectedTime: selectedTime,
      );
}

//! this is for a card...
class _ReminderCardPageState extends State<ReminderCardPage> {
  int timeH;
  int timeM;
  TimeOfDay time = TimeOfDay.now();
  Icon selectedIcon;
  String theTitleOfTheCard;
  int selectedTime;
  _ReminderCardPageState({
    required this.timeH,
    required this.timeM,
    required this.selectedIcon,
    required this.selectedTime,
    required this.theTitleOfTheCard,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, // Open Toggle
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 150,
              width: 360,
              color: const Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 280,
                    child: ListTile(
                      onTap: () {},
                      leading: selectedIcon,
                      title: Text(theTitleOfTheCard),
                      subtitle: Text(
                          '${timeH - time.hour} : ${timeM - time.minute} remain to get a notify'),
                      trailing: Text('$selectedTime remaning'),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      IconButton(
                        onPressed: () {}, // edit the card
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {}, // delete the card
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
