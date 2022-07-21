import 'package:birmbenawa/src/CardWidgets/cards.dart';
import 'package:birmbenawa/src/CardWidgets/reminderCards.dart';
import 'package:birmbenawa/src/screens/reminder_data_card_edit_screen.dart';
import 'package:flutter/material.dart';

class Reminderpage extends StatefulWidget {
  String titleOfTheCard;
  String selectedTime;
  Icon icon;
  int timeH;
  int timeM;
  Reminderpage({
    Key? key,
    required this.titleOfTheCard,
    required this.selectedTime,
    required this.icon,
    required this.timeH,
    required this.timeM,
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
  List _cardList = [];
  void _addCardWidget() {
    setState(() {
      _cardList.add(ReminderCardPage(
        selectedIcon: icon,
        selectedTime: int.parse(selectedTime),
        theTitleOfTheCard: titleOfTheCard,
        timeH: timeH,
        timeM: timeM,
      ));
    });
  }

  _ReminderoageState({
    required this.titleOfTheCard,
    required this.selectedTime,
    required this.icon,
    required this.timeH,
    required this.timeM,
  });
  String titleOfTheCard;
  String selectedTime;
  Icon icon;
  int timeH;
  int timeM;
  List<ReminderCardPage> listOfCards = [];
  final String logoPath = 'assets/images/slider/logo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            CardsView(
              count: 'First',
            ),
            CardsView(
              count: 'Second',
            ),
            CardsView(
              count: 'Third',
            ),
            CardsView(
              count: 'Fourth',
            ),
            CardsView(
              count: 'Fifth',
            ),
            CardsView(
              count: 'Sixth',
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _askedToLead(), //goToHome(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void goToHome(context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ReminderDataEditScreen()));

  Future _askedToLead() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Set an Reminder'),
            children: <Widget>[
              ReminderDataEditScreen(),
            ],
          );
        })) {
    }
  }
}
