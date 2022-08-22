import 'package:flutter/material.dart';

//* this is for transfare selected data from time picker to card
class TimeProvider extends ChangeNotifier {
  int hour = 0;
  int minute = 0;
  String pmOrAm = 'Am';
  changeTime(int ChangedtimHour, int ChangeTimeMinute, String pmOrAmNew) {
    hour = ChangedtimHour;
    minute = ChangeTimeMinute;
    pmOrAm = pmOrAmNew;
  }
}
