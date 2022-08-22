import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardDataProvider extends ChangeNotifier {
  IconData? icon = Icons.add;
  Color color = Colors.white;
  changeCardDataProvider(IconData? iconNew, Color colorNew) {
    icon = iconNew;
    color = colorNew;
  }
}
