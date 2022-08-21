import 'package:birmbenawa/src/models/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimePicker extends StatefulWidget {
  TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  String pmOrAm = 'AM';
  String? hours;
  String? minute;
  TimeOfDay time = TimeOfDay.now();
  String getText() {
    hours = time.hour.toString().padLeft(2, '0');
    minute = time.minute.toString().padLeft(2, '0');
    context.read<TimeProvider>().changeTime(time.hour, time.minute);
    return '${hours}:${minute}';
  }

  TimeOfDay? newDate;
  Future pickTime(context) async {
    final initialTime = TimeOfDay(
      hour: 9,
      minute: 0,
    );
    newDate = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: time,
    );
    if (newDate == null) return;
    setState(
      () {
        time = newDate!;
        pmOrAm = time.hour > 12 ? 'PM' : 'AM';
        //! check the result of provider
      },
    );
  }

  //TODO: Return Hour and Minute to dialog
  //TODO: create a function that will do all process
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => pickTime(context),
          child: Text(
            getText(), //! Return to reminder screen
            style: const TextStyle(fontSize: 50),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          pmOrAm,
          style: TextStyle(fontSize: 50),
        )
      ],
    );
  }

  getPmOrAm() {
    return pmOrAm;
  }
}
