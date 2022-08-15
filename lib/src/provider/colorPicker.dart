import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  Color? color;
  ColorPicker({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState(color: color);
}

//TODO: if user selected one color other colors must be unselectable
class _ColorPickerState extends State<ColorPicker> {
  _ColorPickerState({
    this.color,
  });
  bool? isSelected;
  Color? color;
  bool _isElevated = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        setState(() {
          _isElevated = !_isElevated;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          boxShadow: _isElevated
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
        child: _isElevated
            ? const Icon(
                Icons.select_all,
              )
            : null,
      ),
    );
  }
}
