import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class CustomButtonWidget extends StatefulWidget {
  Icon? itemIcon;
  String? itemText;
  Widget? content;
  double? customHeight;
  double? customWidth;
  GestureTapCallback? ontap;
  CustomButtonWidget({
    Key? key,
    this.content,
    required this.customHeight,
    required this.customWidth,
    required this.ontap,
    this.itemIcon,
    this.itemText,
  }) : super(key: key);

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState(
        content: content,
        customHeight: customHeight,
        customWidth: customWidth,
        ontap: ontap,
        itemIcon: itemIcon,
        itemText: itemText,
      );
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  Icon? _icon = Icon(Icons.add);
  Icon? itemIcon;
  Widget? content;
  String? itemText;
  double? customHeight;
  double? customWidth;
  GestureTapCallback? ontap;
  _CustomButtonWidgetState({
    this.content,
    required this.customHeight,
    required this.customWidth,
    required this.ontap,
    this.itemText,
    this.itemIcon,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Color.fromARGB(255, 167, 167, 167),
      onTap: () {
        _pickIcon();
      },
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
        child: Center(child: _icon),
      ),
    );
  }

  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(
      iconSize: 30,
      context,
      iconPackModes: [IconPack.cupertino],
    );
    _icon = Icon(
      icon,
      size: 40,
    );
    setState(() {
      _icon = Icon(icon);
    });
  }
}
