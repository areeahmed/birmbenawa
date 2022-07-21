import 'package:flutter/material.dart';

class CustomToggleButtonWidget extends StatefulWidget {
  Widget? content;
  double? customHeight;
  double? customWidth;
  String? textItem;
  Color? fstColor;
  Color? sndColor;
  GestureTapCallback? ontap;
  CustomToggleButtonWidget({
    Key? key,
    this.content,
    required this.customHeight,
    required this.customWidth,
    required this.ontap,
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
        ontap: ontap,
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
    required this.ontap,
    this.fstColor,
    this.sndColor,
    this.textItem,
  });
  String? textItem;
  Color? fstColor;
  Color? sndColor;
  Widget? content;
  double? customHeight;
  double? customWidth;
  GestureTapCallback? ontap;
  bool _isElevated = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isElevated = !_isElevated;
          if (_isElevated == true) {
            fstColor = Colors.pink;
          } else if (_isElevated == false) {
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
          borderRadius: BorderRadius.circular(50),
          boxShadow: _isElevated
              ? [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(4, 4),
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
            child: content == null
                ? Text(
                    textItem ?? 'No Text',
                    style: TextStyle(color: fstColor),
                  )
                : content,
          ),
        ),
      ),
    );
  }
}
