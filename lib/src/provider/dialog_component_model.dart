import 'package:birmbenawa/src/models/time_provider.dart';
import 'package:birmbenawa/src/provider/days_button_data.dart';
import 'package:birmbenawa/src/widgets/custom_toggle_button.dart';
import 'package:birmbenawa/src/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class transferred {
  transferred({required this.isDailyReminder});
  bool isDailyReminder = false;
  TextEditingController titleOfCard = TextEditingController();
  TextEditingController descriptionOfCard = TextEditingController();

  String? text;
  Widget dialogBody({bool? daysOnOFF, required BuildContext context}) {
    return Container(
      color: Colors.grey.shade300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey.shade300,
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                //? Entering a title
                titleTextFieldDialogWidget('Enter Title', titleOfCard),
                const SizedBox(
                  height: 10,
                ),
                titleTextFieldDialogWidget(
                    'Enter More Detail', descriptionOfCard),
                const SizedBox(
                  height: 10,
                ),
                TimePicker(), //* Time is fixed
                const SizedBox(
                  height: 10,
                ),
                //? for selecting ICons ( Icon Picker and showing Icon)
                const SizedBox(
                  height: 30,
                ),
                //! Days
                isDailyReminder ? DaysPickerDialogModelWidget() : Container(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //TODO when we pressed the save button it should do 2 things store the date to hive database and then pop dialog
                  //TODO Give data to the data base
                  debugPrint(
                      'Time: ${context.read<TimeProvider>().hour} : ${context.read<TimeProvider>().minute} \n Title: ${titleOfCard.text} \n Description: ${descriptionOfCard.text}');
                },
                child: Text(
                  'Save',
                ),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  popDialog(context);
                },
                child: Text(
                  'Cancle',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  popDialog(context) {
    return Navigator.of(context, rootNavigator: true).pop();
  }

  //! this widget transferred to edit reminder card screen
  Widget titleTextFieldDialogWidget(
      String hintedText, TextEditingController controllerData) {
    return TextField(
      controller: controllerData,
      decoration: InputDecoration(
        hintText: hintedText,
      ),
    );
  }

  bool _isElevated = false;
  DaysButtonData sat =
      DaysButtonData(color: Colors.black, day: 'Sat', checked: false);
  DaysButtonData sun =
      DaysButtonData(color: Colors.black, day: 'Sun', checked: false);
  DaysButtonData mon =
      DaysButtonData(color: Colors.black, day: 'Mon', checked: false);
  DaysButtonData tue =
      DaysButtonData(color: Colors.black, day: 'Tue', checked: false);
  DaysButtonData wed =
      DaysButtonData(color: Colors.black, day: 'Wed', checked: false);
  DaysButtonData thu =
      DaysButtonData(color: Colors.black, day: 'Thu', checked: false);
  DaysButtonData fri =
      DaysButtonData(color: Colors.black, day: 'Fri', checked: false);
  @override
  Widget DaysPickerDialogModelWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! Sat
            CustomToggleButtonWidget(
              textItem: sat.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 8),
            //! Sun
            CustomToggleButtonWidget(
              textItem: sun.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 8),
            //! Mon
            CustomToggleButtonWidget(
              textItem: mon.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! Tue
            CustomToggleButtonWidget(
              textItem: tue.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 8),
            //! Wed
            CustomToggleButtonWidget(
              textItem: wed.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 8),
            //! Thu
            CustomToggleButtonWidget(
              textItem: thu.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 8),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! Fri
            CustomToggleButtonWidget(
              textItem: fri.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );
  }

  Widget ElevatedButtonDialogWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        child: Text(
          text == '' ? 'text is empty' : text!,
        ), // saveing and creating a card i reminder screen
      ),
    );
  }
}
