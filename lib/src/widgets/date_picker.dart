import 'package:birmbenawa/src/models/date_picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatePickerScreen extends StatefulWidget {
  DatePickerScreen({Key? key}) : super(key: key);

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextButton(
            child: Text(
              '${date.year} / ${date.month} / ${date.day}',
              style: TextStyle(
                fontSize: 32,
                color: Color.fromARGB(255, 98, 0, 255),
              ),
            ),
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );

              //if 'CANCEL' => null
              if (newDate == null) return;

              setState(() {
                date = newDate;
                context.read<DatePickerProvider>().changeDate(
                    yearNow: newDate.year,
                    monthNow: newDate.month,
                    dayNow: newDate.day);
              });
            },
          )
        ],
      ),
    );
  }
}
