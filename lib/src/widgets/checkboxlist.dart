import 'package:flutter/material.dart';

class CheckBoxBuildWidget extends StatefulWidget {
  CheckBoxBuildWidget({Key? key}) : super(key: key);

  @override
  State<CheckBoxBuildWidget> createState() => _CheckBoxBuildWidgetState();
}

class _CheckBoxBuildWidgetState extends State<CheckBoxBuildWidget> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (value) {
        setState(() {
          this.value = value;
        });
      },
    );
  }
}

class CheckBoxChecked {
  bool? checked;

  CheckBoxChecked({
    this.checked,
  });
}
