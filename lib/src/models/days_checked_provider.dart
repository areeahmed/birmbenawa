import 'package:flutter/cupertino.dart';

class IsDaysChecked extends ChangeNotifier {
  bool satDay = false;

  bool sunDay = false;

  bool monDay = false;

  bool tueDay = false;

  bool thrDay = false;

  bool wedDay = false;

  bool friDay = false;

  satChanges({
    required bool sat,
  }) {
    satDay = sat;
  }

  sunChanges({
    required bool sun,
  }) {
    sunDay = sun;
  }

  monChanges({
    required bool mon,
  }) {
    monDay = mon;
  }

  tueChanges({
    required bool tue,
  }) {
    tueDay = tue;
  }

  wedChanges({
    required bool wed,
  }) {
    wedDay = wed;
  }

  thrChanges({
    required bool thr,
  }) {
    thrDay = thr;
  }

  friChanges({
    required bool fri,
  }) {
    friDay = fri;
  }
}
