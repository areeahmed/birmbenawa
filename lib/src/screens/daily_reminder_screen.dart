import 'package:birmbenawa/src/provider/daily_remider_model.dart';
import 'package:birmbenawa/src/provider/dialog_component_model.dart';
import 'package:birmbenawa/src/provider/used_too_mutch.dart';
import 'package:flutter/material.dart';

class DailyReminderPage extends StatefulWidget {
  const DailyReminderPage({Key? key}) : super(key: key);

  @override
  State<DailyReminderPage> createState() => _DailyReminderPageState();
}

class _DailyReminderPageState extends State<DailyReminderPage> {
  transferred dialogBody = transferred(isDailyReminder: true);
  DailyReminderScreenModel dailyReminderCard = DailyReminderScreenModel();
  UsedTooMutch userTooMutch = UsedTooMutch();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //* Appbar ( LogoIcon - NameOfPageText - DarwerIcon)

        //* Text for greeting the user ( Hello Name of the user that we get from << RegisterPage >>)

        //* ListViewBuilder ==> Showing the cards that user will create and the screen show ( No Card is Created if the list was empty )

        //* Button Action to create a Card

        //* Cards contains ==> ( Title - Description - Time - Icon - color - remining time for reminding)
        floatingActionButton: userTooMutch.FloatingActionButtonTooMutchUsed(
      () => userTooMutch.askedToLead(
          dialogBody.dialogBody(context: context), context),
    ));
  }
}
