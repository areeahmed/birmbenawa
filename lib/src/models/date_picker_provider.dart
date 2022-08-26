import 'package:flutter/widgets.dart';

class DatePickerProvider extends ChangeNotifier {
  int year = 2022;
  int month = 12;
  int day = 24;

  changeDate(
      {required int yearNow, required int monthNow, required int dayNow}) {
    this.year = yearNow;
    this.month = monthNow;
    this.day = dayNow;
  }
}
