import 'package:flutter/material.dart';

class CardDataProvider extends ChangeNotifier {
  IconData? icon = Icons.add;
  Color color = Colors.white;
  changeCardDataProvider(IconData? iconNew, Color colorNew) {
    icon = iconNew;
    color = colorNew;
  }
}
