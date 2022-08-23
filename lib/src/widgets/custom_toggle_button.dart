import 'package:flutter/material.dart';

class CustomToggleButtonWidget extends StatefulWidget {
  Widget? content;
  double? customHeight;
  double? customWidth;
  String? textItem;
  Color? fstColor;
  Color? sndColor;
  CustomToggleButtonWidget({
    Key? key,
    this.content,
    required this.customHeight,
    required this.customWidth,
    this.fstColor,
    this.sndColor,
    this.textItem,
  }) : super(key: key);

  @override
  State<CustomToggleButtonWidget> createState() =>
      _CustomToggleButtonWidgetState(
        content: content,
        customHeight: customHeight,
        customWidth: customWidth,
        fstColor: fstColor,
        sndColor: sndColor,
        textItem: textItem,
      );
}

class _CustomToggleButtonWidgetState extends State<CustomToggleButtonWidget> {
  _CustomToggleButtonWidgetState({
    this.content,
    required this.customHeight,
    required this.customWidth,
    this.fstColor,
    this.sndColor,
    this.textItem,
  });
  bool isElevated = false;
  String? textItem;
  Color? fstColor;
  Color? sndColor;
  Widget? content;
  double? customHeight;
  double? customWidth;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isElevated = !isElevated;
          if (isElevated == true) {
            fstColor = Colors.pink;
          } else if (isElevated == false) {
            fstColor = Colors.black;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: customHeight,
        width: customWidth,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
          boxShadow: isElevated
              ? [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Container(
            child: content ??
                Text(
                  textItem ?? 'No Text',
                  style: TextStyle(color: fstColor, fontFamily: 'PeshangBold'),
                ),
          ),
        ),
      ),
    );
  }
}
