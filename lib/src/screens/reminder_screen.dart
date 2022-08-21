import 'package:birmbenawa/src/provider/dialog_component_model.dart';
import 'package:birmbenawa/src/provider/navigating_between_screens.dart';
import 'package:birmbenawa/src/provider/reminder_screen_models.dart';
import 'package:birmbenawa/src/provider/used_too_mutch.dart';
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
  State<Reminderpage> createState() => _ReminderoageState(
        titleOfTheCard: titleOfTheCard,
        selectedTime: selectedTime,
        timeH: timeH,
        timeM: timeM,
      );
}

class _ReminderoageState extends State<Reminderpage> {
  NaviagtingBetweenScreens navigateBetweenScreens = NaviagtingBetweenScreens();
  _ReminderoageState({
    required this.titleOfTheCard,
    required this.selectedTime,
    required this.timeH,
    required this.timeM,
  });
  UsedTooMutch usedTooMutch = UsedTooMutch();
  String? titleOfTheCard;
  String? selectedTime;
  IconData? icon;
  int? timeH;
  int? timeM;
  transferred dialogComponentModelWidgets = transferred(isDailyReminder: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box('name').listenable(),
        builder: ((context, card, child) {
          return Center(
            child: ListView.builder(
                itemCount: card.length,
                itemBuilder: ((context, index) {
                  Map<dynamic, dynamic> _data = box.getAt(index);
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
