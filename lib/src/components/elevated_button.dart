import 'package:flutter/material.dart';

class SavedElevatedButton extends StatefulWidget {
  String text;
  SavedElevatedButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<SavedElevatedButton> createState() =>
      _SavedElevatedButtonState(text: text);
}

class _SavedElevatedButtonState extends State<SavedElevatedButton> {
  _SavedElevatedButtonState({required this.text});
  bool _isElevated = false;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        child: Text(
          text,
        ), // saveing and creating a card i reminder screen
      ),
    );
  }
}
