import 'package:birmbenawa/src/provider/colorPicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class ReminderScreenModel extends StatefulWidget {
  ReminderScreenModel({Key? key}) : super(key: key);

  @override
  State<ReminderScreenModel> createState() => _ReminderScreenModelState();
}

class _ReminderScreenModelState extends State<ReminderScreenModel> {
  IconData? icon = Icons.person;
  String? time; //! requeared
  bool? pm; //! requeared
  bool? am; //! requeared
  String? title;
  Icon? _icon;
  String? titleOfTheCard;
  String? selectedTime;
  int? timeH;
  int? timeM;

  double paddingTopContainer = 10.0;
  int durationOfGestureDetector = 300;
  double paddingOfGestureDetector = 8;
  double? heightOfGestureDetector = 133;
  double? widthOfGestureDetector = 376;
  double borderRadiusOfGestureDetector = 12;
  Color? colorOfestureDetector = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusOfGestureDetector),
      ),
      padding: EdgeInsets.only(top: paddingTopContainer),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(paddingOfGestureDetector),
            margin: EdgeInsets.only(left: 8),
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
                    IconButton(
                      onPressed: () async {
                        IconData? iconData =
                            await FlutterIconPicker.showIconPicker(
                          iconSize: 30,
                          context,
                          iconPackModes: [IconPack.cupertino],
                        );
                        setState(() {
                          icon = iconData;
                        });
                      },
                      icon: Icon(icon),
                      iconSize: 50,
                    ),
                    TitleAndDiscriptionOfTheCardWidget(),
                    CardTimeAndPMOrAM(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /* SHOW the picked icon will be showen here
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
  }*/

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

  Widget pickCustomColorOfTheCardDialogCompWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColorPicker(
              color: const Color.fromARGB(255, 146, 242, 255),
            ),
            const SizedBox(width: 10),
            ColorPicker(
              color: const Color.fromARGB(255, 255, 135, 175),
            ),
            const SizedBox(width: 10),
            ColorPicker(
              color: const Color.fromARGB(255, 255, 118, 118),
            ),
            const SizedBox(width: 10),
            ColorPicker(
              color: const Color.fromARGB(255, 119, 61, 255),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColorPicker(
              color: const Color.fromARGB(255, 129, 255, 133),
            ),
            const SizedBox(width: 10),
            ColorPicker(
              color: Colors.yellow,
            ),
            const SizedBox(width: 10),
            ColorPicker(
              color: const Color.fromARGB(255, 255, 190, 92),
            ),
            const SizedBox(width: 10),
            ColorPicker(
              color: const Color.fromARGB(255, 255, 58, 229),
            ),
          ],
        ),
      ],
    );
  }
}
