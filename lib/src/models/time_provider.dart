import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  int hour = 0;
  int minute = 0;

  changeTime(int ChangedtimHour, int ChangeTimeMinute) {
    hour = ChangedtimHour;
    minute = ChangeTimeMinute;
  }
}
