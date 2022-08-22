import 'package:birmbenawa/src/models/reminder_card_data.dart';
import 'package:birmbenawa/src/provider/daily_remider_model.dart';
import 'package:birmbenawa/src/provider/used_too_mutch.dart';
import 'package:birmbenawa/src/screens/edit_daily_reminder_card_screen.dart';
import 'package:flutter/material.dart';

class DailyReminderPage extends StatefulWidget {
  const DailyReminderPage({Key? key}) : super(key: key);

  @override
  State<DailyReminderPage> createState() => _DailyReminderPageState();
}

class _DailyReminderPageState extends State<DailyReminderPage> {
  // transferred dialogBody = transferred(isDailyReminder: true);
  DailyReminderScreenModel dailyReminderCard = DailyReminderScreenModel();
  UsedTooMutch userTooMutch = UsedTooMutch();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ReminderCardData remidnerCardData = Rem
        //* Appbar ( LogoIcon - NameOfPageText - DarwerIcon)

        //* Text for greeting the user ( Hello Name of the user that we get from << RegisterPage >>)

        //* ListViewBuilder ==> Showing the cards that user will create and the screen show ( No Card is Created if the list was empty )

        //* Button Action to create a Card

        //* Cards contains ==> ( Title - Description - Time - Icon - color - remining time for reminding)
        floatingActionButton: userTooMutch.FloatingActionButtonTooMutchUsed(
            () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditDailyReminderCardScreen(),
                ))));
  }
}
