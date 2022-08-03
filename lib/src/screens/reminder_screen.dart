import 'package:birmbenawa/src/components/reminder_data_card_edit_screen.dart';
import 'package:birmbenawa/src/models/navigating_between_screens.dart';
import 'package:birmbenawa/src/models/reminder_screen_model.dart';
import 'package:birmbenawa/src/models/used_too_mutch.dart';
import 'package:flutter/material.dart';

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
  List<ReminderScreenModel> listOfCards = [];
  ReminderScreenModel reminderScreenComponentModel = ReminderScreenModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 80,
            left: 8,
            right: 8,
          ),
          child: Column(children: [
            //! this cards here is wrong the user must add the cards by pressing button
            //! and this will be by using firebase and StreamBuilder and ListViewBuilder and Futurs
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
            reminderScreenComponentModel.CardBodyRemiderScreen(),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
        onPressed: () => usedTooMutch.askedToLead(
            ReminderDataEditScreen, context), //goToHome(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  // Future _askedToLead() async {
  //   switch (await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return const SimpleDialog(
  //         title: Text('Set an Reminder'),
  //         children: <Widget>[
  //           ReminderDataEditScreen(),
  //         ],
  //       );
  //     },
  //   )) {
  //   }
  // }
}
