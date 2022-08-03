import 'package:birmbenawa/src/components/reminder_data_card_edit_screen.dart';
import 'package:flutter/material.dart';

class NaviagtingBetweenScreens {
  reminderDateEditScreen(context) => Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ReminderDataEditScreen()));
}
