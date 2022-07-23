import 'package:birmbenawa/src/screens/daily_Edit_data.dart';
import 'package:flutter/material.dart';

import '../CardWidgets/cards.dart';

class DailyReminderPage extends StatefulWidget {
  const DailyReminderPage({Key? key}) : super(key: key);

  @override
  State<DailyReminderPage> createState() => _DailyReminderPageState();
}

class _DailyReminderPageState extends State<DailyReminderPage> {
  final String logoPath = 'assets/images/slider/logo.png';
  final _cards = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* Appbar ( LogoIcon - NameOfPageText - DarwerIcon)

      //* Text for greeting the user ( Hello Name of the user that we get from << RegisterPage >>)

      //* ListViewBuilder ==> Showing the cards that user will create and the screen show ( No Card is Created if the list was empty )

      //* Button Action to create a Card

      //* Cards contains ==> ( Title - Description - Time - Icon - color - remining time for reminding)
      body: Container(
        color: Colors.grey[300],
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 80,
            left: 8,
            right: 8,
          ),
          child: Column(children: [
            CardsView(),
            CardsView(),
            CardsView(),
            CardsView(),
            CardsView(),
            CardsView(),
            CardsView(),
            CardsView(),
            CardsView(),
            CardsView(),
            CardsView(),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () => _askedToLead(),
        child: Icon(Icons.add),
      ),
    );
  }

  Future _askedToLead() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.grey[300],
            title: const Text('Set an Reminder'),
            children: <Widget>[
              DailyReminderDataEdit(),
            ],
          );
        })) {
    }
  }
}
