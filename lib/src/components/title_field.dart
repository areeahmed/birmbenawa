import 'package:flutter/material.dart';

class TitleTextField extends StatefulWidget {
  String hintedText;
  TitleTextField({
    Key? key,
    required this.hintedText,
  }) : super(key: key);

  @override
  State<TitleTextField> createState() => _TitleTextFieldState(
        hintedText: hintedText,
      );
}

class _TitleTextFieldState extends State<TitleTextField> {
  _TitleTextFieldState({
    required this.hintedText,
  });
  String hintedText;
  String? titleOfTheCard;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintedText,
      ),
      onChanged: (text) {
        if (text == null) {
          titleOfTheCard = 'Unknown Title';
        } else {
          titleOfTheCard = text; //! Return to reminder screen
        }
      },
    );
  }
}
