import 'package:birmbenawa/src/models/time_provider.dart';
import 'package:birmbenawa/src/provider/colorPicker.dart';
import 'package:birmbenawa/src/provider/days_button_data.dart';
import 'package:birmbenawa/src/widgets/custom_toggle_button.dart';
import 'package:birmbenawa/src/widgets/icon_picker.dart';
import 'package:birmbenawa/src/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:provider/provider.dart';

class DialogComponentModelWidgets {
  DialogComponentModelWidgets({required this.isDailyReminder});
  bool isDailyReminder = false;
  TextEditingController titleOfCard = TextEditingController();
  TextEditingController descriptionOfCard = TextEditingController();
  Icon? _icon;
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
                TimePicker(), //! this is a problem ???
                const SizedBox(
                  height: 10,
                ),
                //? for selecting ICons ( Icon Picker and showing Icon)
                pickIconForMe(context),
                const SizedBox(
                  height: 30,
                ),
                //! Days
                isDailyReminder ? DaysPickerDialogModelWidget() : Container(),
                const SizedBox(
                  height: 30,
                ),
                pickCustomColorOfTheCardDialogCompWidget(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                //TODO: Call the function that will be inside PickTime Class, define PickTime Class here
                onPressed: () {
                  //! Give Data to Database
                  debugPrint(
                      '${context.read<TimeProvider>().hour} : ${context.read<TimeProvider>().minute}');
                },
                child: Text(
                  'Save',
                ), // saveing and creating a card i reminder screen
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
                ), // saveing and creating a card i reminder screen
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

  Widget titleTextFieldDialogWidget(
      String hintedText, TextEditingController controllerData) {
    return TextField(
      controller: controllerData,
      decoration: InputDecoration(
        hintText: hintedText,
      ),
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

  Widget pickIconForMe(BuildContext context) {
    return CustomButtonWidget(
      content: _icon,
      customHeight: 50,
      customWidth: 50,
      ontap: () => _pickIcon(context),
    );
  }

  _pickIcon(context) async {
    IconData? icon = await FlutterIconPicker.showIconPicker(
      iconSize: 30,
      context,
      iconPackModes: [IconPack.cupertino],
    );
    _icon = Icon(
      icon,
      size: 40,
    );
    _icon = Icon(icon);
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
