import 'package:birmbenawa/src/components/collectionOfColorPicker.dart';
import 'package:birmbenawa/src/components/elevated_button.dart';
import 'package:birmbenawa/src/components/pick_icon.dart';
import 'package:birmbenawa/src/components/timepicker.dart';
import 'package:birmbenawa/src/components/title_field.dart';
import 'package:flutter/material.dart';

class ReminderDataEditScreen extends StatefulWidget {
  const ReminderDataEditScreen({Key? key}) : super(key: key);

  @override
  State<ReminderDataEditScreen> createState() => _ReminderDataEditScreenState();
}

class _ReminderDataEditScreenState extends State<ReminderDataEditScreen> {
  String? titleOfTheCard;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //? Entering a title
              TitleTextField(
                hintedText: 'Enter Title',
              ),
              const SizedBox(
                height: 10,
              ),
              TitleTextField(
                hintedText: 'Enter More Detail',
              ),
              const SizedBox(
                height: 10,
              ),
              TimePicker(),
              const SizedBox(
                height: 10,
              ),
              //? for selecting ICons ( Icon Picker and showing Icon)
              MyIconpickerWidget(),
              const SizedBox(
                height: 30,
              ),
              CollectionOfColorPicker(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SavedElevatedButton(text: 'save'),
            SavedElevatedButton(text: 'cancle'),
          ],
        )
      ],
    );
  }
}
