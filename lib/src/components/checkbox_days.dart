import 'package:birmbenawa/src/components/custom_toggle_Button.dart';
import 'package:birmbenawa/src/models/days_button_data.dart';
import 'package:flutter/material.dart';

class ChechBoxOfDays extends StatefulWidget {
  const ChechBoxOfDays({Key? key}) : super(key: key);

  @override
  State<ChechBoxOfDays> createState() => _ChechBoxOfDaysState();
}

class _ChechBoxOfDaysState extends State<ChechBoxOfDays> {
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
  Widget build(BuildContext context) {
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
}
