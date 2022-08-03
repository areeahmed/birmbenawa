import 'package:birmbenawa/src/models/daily_remider_model.dart';
import 'package:birmbenawa/src/models/dialog_component_model.dart';
import 'package:birmbenawa/src/models/used_too_mutch.dart';
import 'package:flutter/material.dart';

class DailyReminderPage extends StatefulWidget {
  const DailyReminderPage({Key? key}) : super(key: key);

  @override
  State<DailyReminderPage> createState() => _DailyReminderPageState();
}

class _DailyReminderPageState extends State<DailyReminderPage> {
  DialogComponentModelWidgets dialogBody = DialogComponentModelWidgets();
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
        body: Container(
          color: Colors.grey[200],
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 80,
              left: 8,
              right: 8,
            ),
            child: Column(children: [
              //! those cards most not be here it will be add by user
              dailyReminderCard.CardShowDailyReminderWidget(),
              dailyReminderCard.CardShowDailyReminderWidget(),
              dailyReminderCard.CardShowDailyReminderWidget(),
              dailyReminderCard.CardShowDailyReminderWidget(),
              dailyReminderCard.CardShowDailyReminderWidget(),
              dailyReminderCard.CardShowDailyReminderWidget(),
              dailyReminderCard.CardShowDailyReminderWidget(),
              dailyReminderCard.CardShowDailyReminderWidget(),
              dailyReminderCard.CardShowDailyReminderWidget(),
              dailyReminderCard.CardShowDailyReminderWidget(),
              dailyReminderCard.CardShowDailyReminderWidget(),
              dailyReminderCard.CardShowDailyReminderWidget(),
            ]),
          ),
        ),
        floatingActionButton: userTooMutch.FloatingActionButtonTooMutchUsed(
          () => userTooMutch.askedToLead(dialogBody.dialogBody(), context),
        ));
  }
}
