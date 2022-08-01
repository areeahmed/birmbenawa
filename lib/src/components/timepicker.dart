import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  int? timeH;
  int? timeM;
  TimeOfDay time = TimeOfDay(hour: 9, minute: 0);
  String getText() {
    if (time == null) {
      return '00:00';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minute = time.minute.toString().padLeft(2, '0');
      timeH = time.hour;
      timeM = time.minute;
      return '${hours}:${minute}';
    }
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newDate = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: time,
    );
    if (newDate == null) return;
    setState(() => time = newDate);
  }

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
}
