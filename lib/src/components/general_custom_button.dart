import 'package:flutter/material.dart';

class GeneralCustomButtonWidget extends StatefulWidget {
  Icon? itemIcon;
  String itemText;
  Widget? content;
  double? customHeight;
  double? customWidth;
  GestureTapCallback? ontap;
  GeneralCustomButtonWidget({
    Key? key,
    this.content,
    required this.customHeight,
    required this.customWidth,
    required this.ontap,
    this.itemIcon,
    required this.itemText,
  }) : super(key: key);

  @override
  State<GeneralCustomButtonWidget> createState() => _CustomButtonWidgetState(
        content: content,
        customHeight: customHeight,
        customWidth: customWidth,
        ontap: ontap,
        itemIcon: itemIcon,
        itemText: itemText,
      );
}

class _CustomButtonWidgetState extends State<GeneralCustomButtonWidget> {
  Icon? itemIcon;
  Widget? content;
  String itemText;
  double? customHeight;
  double? customWidth;
  GestureTapCallback? ontap;
  _CustomButtonWidgetState({
    this.content,
    required this.customHeight,
    required this.customWidth,
    required this.ontap,
    required this.itemText,
    this.itemIcon,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Color.fromARGB(255, 167, 167, 167),
      onTap: () => ontap!(),
      child: Container(
        height: customHeight,
        width: customWidth,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(4, 4),
            ),
            const BoxShadow(
              color: Colors.white,
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(-4, -4),
            )
          ],
        ),
        child: Center(
            child: content == null
                ? Text(
                    itemText,
                    style: TextStyle(
                      fontFamily: 'PeshangBold',
                      fontSize: 20,
                      color: Color.fromARGB(255, 98, 0, 255),
                    ),
                  )
                : itemIcon),
      ),
    );
  }
}
