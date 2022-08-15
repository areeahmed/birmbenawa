import 'package:flutter/material.dart';

class DaysButtonData {
  String day;
  Color color = Colors.black;
  bool checked;
  //TODO if days picked so it should return the bool value to the card to know witch one will be the pink color
  DaysButtonData(
      {required this.color, required this.day, required this.checked});
}
