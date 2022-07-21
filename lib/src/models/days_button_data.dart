import 'package:flutter/material.dart';

class DaysButtonData {
  String day;
  Color color = Colors.black;
  bool checked;

  DaysButtonData(
      {required this.color, required this.day, required this.checked});
}
