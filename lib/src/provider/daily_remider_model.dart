import 'package:flutter/material.dart';

class DailyReminderScreenModel {
  String? time; //! requeared
  bool? pm; //! requeared
  bool? am; //! requeared
  String? title;
  Icon? icon;
  var isDaySelected = true;
  TextStyle? daysCheckedOrNotChecked() {
    return TextStyle(
      color: isDaySelected == true ? Colors.pink : Colors.black,
    );
  }

  Widget CardShowDailyReminderWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.only(top: 13),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              //setState(() {});
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(8),
              height: 160,
              width: 376,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  //! Days
                  DaysCheckedView(),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      PickedIconCard(),
                      TitleAndDiscriptionOfTheCardWidget(),
                      //! Time Column
                      CardTimeAndPMOrAM(),
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

  Widget DaysCheckedView() {
    final listOfDays = ['SAT', 'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI'];
    return Container(
      padding: const EdgeInsets.fromLTRB(19, 8, 8, 0),
      child: Row(
        children: [
          Text(listOfDays[0], style: daysCheckedOrNotChecked()),
          const SizedBox(width: 2),
          Text(listOfDays[1], style: daysCheckedOrNotChecked()),
          const SizedBox(width: 2),
          Text(listOfDays[2], style: daysCheckedOrNotChecked()),
          const SizedBox(width: 2),
          Text(listOfDays[3], style: daysCheckedOrNotChecked()),
          const SizedBox(width: 2),
          Text(listOfDays[4], style: daysCheckedOrNotChecked()),
          const SizedBox(width: 2),
          Text(listOfDays[5], style: daysCheckedOrNotChecked()),
          const SizedBox(width: 2),
          Text(listOfDays[6], style: daysCheckedOrNotChecked()),
        ],
      ),
    );
  }

  //* the picked icon will be showen here
  Widget PickedIconCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        children: const [
          Icon(
            Icons.person,
            size: 50,
          ),
        ],
      ),
    );
  }

//* SHOW a title and a discription of the card that the user want to be reminded
  Widget TitleAndDiscriptionOfTheCardWidget() {
    return Container(
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
    );
  }

  Widget CardTimeAndPMOrAM() {
    return Column(
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
    );
  }
}
