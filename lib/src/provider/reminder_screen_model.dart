import 'package:flutter/material.dart';

class ReminderScreenModel {
  String? time; //! requeared
  bool? pm; //! requeared
  bool? am; //! requeared
  String? title;
  Icon? icon;
  String? titleOfTheCard;
  String? selectedTime;
  int? timeH;
  int? timeM;

  //* Some Valiable for Style of the card:
  double paddingTopContainer = 10.0;
  int durationOfGestureDetector = 300;
  double paddingOfGestureDetector = 8;
  double? heightOfGestureDetector = 133;
  double? widthOfGestureDetector = 376;
  double borderRadiusOfGestureDetector = 12;
  Color? colorOfestureDetector = Colors.white;

  //* the Card Body of the reminder screen
  //! the GestureDetector isn't do any thing for now...
  //TODO store data to hive and add cards to screen using hive database
  Widget CardBodyRemiderScreen() {
    return Container(
      height: 135,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiusOfGestureDetector),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade300, offset: Offset(0, 10))
          ]),
      padding: EdgeInsets.only(top: paddingTopContainer),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: AnimatedContainer(
              duration: Duration(milliseconds: durationOfGestureDetector),
              padding: EdgeInsets.all(paddingOfGestureDetector),
              height: heightOfGestureDetector,
              width: widthOfGestureDetector,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(borderRadiusOfGestureDetector),
                color: colorOfestureDetector,
              ),
              child: Column(
                children: [
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
            'ناونیشان',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'زانیاری زیاتر',
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
