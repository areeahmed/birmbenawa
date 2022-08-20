import 'package:birmbenawa/src/provider/dialog_component_model.dart';
import 'package:birmbenawa/src/provider/navigating_between_screens.dart';
import 'package:birmbenawa/src/provider/reminder_screen_model.dart';
import 'package:birmbenawa/src/provider/used_too_mutch.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Reminderpage extends StatefulWidget {
  String? titleOfTheCard;
  String? selectedTime;
  Icon? icon;
  int? timeH;
  int? timeM;
  Reminderpage({
    Key? key,
    this.titleOfTheCard,
    this.selectedTime,
    this.icon,
    this.timeH,
    this.timeM,
  }) : super(key: key);
  @override
  State<Reminderpage> createState() => _ReminderoageState(
        titleOfTheCard: titleOfTheCard,
        selectedTime: selectedTime,
        icon: icon,
        timeH: timeH,
        timeM: timeM,
      );
}

class _ReminderoageState extends State<Reminderpage> {
  NaviagtingBetweenScreens navigateBetweenScreens = NaviagtingBetweenScreens();
  _ReminderoageState({
    required this.titleOfTheCard,
    required this.selectedTime,
    required this.icon,
    required this.timeH,
    required this.timeM,
  });
  UsedTooMutch usedTooMutch = UsedTooMutch();
  String? titleOfTheCard;
  String? selectedTime;
  Icon? icon;
  int? timeH;
  int? timeM;
  DialogComponentModelWidgets dialogComponentModelWidgets =
      DialogComponentModelWidgets(isDailyReminder: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
        onPressed: () => usedTooMutch.askedToLead(
            dialogComponentModelWidgets.dialogBody(context: context),
            context), //goToHome(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }
}
