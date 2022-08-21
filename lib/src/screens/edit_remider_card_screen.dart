import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/image_screens.dart';
import 'package:birmbenawa/src/provider/days_button_data.dart';
import 'package:birmbenawa/src/widgets/custom_toggle_button.dart';
import 'package:birmbenawa/src/widgets/time_picker.dart';
import 'package:flutter/material.dart';

class EditReminderCardScreen extends StatelessWidget {
  EditReminderCardScreen({
    Key? key,
  })
  //required this.isDailyReminder
  : super(key: key);
  bool isDailyReminder = true;
  @override
  Widget build(BuildContext context) {
    ImageProcess process = ImageProcess();
    ImageScreen imageScreen = ImageScreen();
    TextEditingController titleController = TextEditingController();
    TextEditingController controllerData2 = TextEditingController();
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  imageScreen.editScreen,
                  height: 250,
                  width: 250,
                ),
                //TODO add time icon to the screen ==> Done
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                    bottom: 12,
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                ),
                //TODO add title ( text field ) ==> Done
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                  ),
                  child: TextField(
                    controller: controllerData2,
                    decoration: InputDecoration(
                      hintText: 'Description',
                    ),
                  ),
                ),
                //TODO add description ( text field ) ==> Done
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 20,
                  ),
                  child: TimePicker(),
                ),
                //TODO add time picker ( Button => open time dialog ) ==> Done
                isDailyReminder ? DaysPickerDialogModelWidget() : Container(),
                //TODO add a color picker ( Drop Down Button )
                //TODO add an Icon picker ( Button to open Icon Dialog )
              ],
            ),
          ),
        ));
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
            const SizedBox(width: 12),
            //! Sun
            CustomToggleButtonWidget(
              textItem: sun.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 12),
            //! Mon
            CustomToggleButtonWidget(
              textItem: mon.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 12),
            //! Tue
            CustomToggleButtonWidget(
              textItem: tue.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 12),
            //! Wed
            CustomToggleButtonWidget(
              textItem: wed.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 12),
            //! Thu
            CustomToggleButtonWidget(
              textItem: thu.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
          ],
        ),
        const SizedBox(width: 12, height: 12),
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
          ],
        ),
      ],
    );
  }
}
