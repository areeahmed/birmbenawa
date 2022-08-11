import 'package:flutter/material.dart';

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
    setState(() {
      time = newDate!;
    });
  }

  //TODO: Return Hour and Minute to dialog
  //TODO: create a function that will do all process
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //? for showing the time
        Text(
          getText(), //! Return to reminder screen
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(
          width: 100,
        ),
        //? Time Picker
        IconButton(
            onPressed: () => pickTime(context), icon: const Icon(Icons.watch)),
      ],
    );
  }

  getPmOrAm() {
    return pmOrAm;
  }
}
