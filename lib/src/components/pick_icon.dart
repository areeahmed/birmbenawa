import 'package:birmbenawa/src/components/custom_button.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter/material.dart';

class MyIconpickerWidget extends StatefulWidget {
  MyIconpickerWidget({Key? key}) : super(key: key);

  @override
  State<MyIconpickerWidget> createState() => _MyIconpickerWidgetState();
}

class _MyIconpickerWidgetState extends State<MyIconpickerWidget> {
  Icon? _icon;
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

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      content: _icon,
      customHeight: 50,
      customWidth: 50,
      ontap: _pickIcon,
    );
  }
}
