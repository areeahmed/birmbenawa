import 'package:birmbenawa/src/components/colorPicker.dart';
import 'package:flutter/material.dart';

class CollectionOfColorPicker extends StatefulWidget {
  CollectionOfColorPicker({Key? key}) : super(key: key);

  @override
  State<CollectionOfColorPicker> createState() =>
      _CollectionOfColorPickerState();
}

class _CollectionOfColorPickerState extends State<CollectionOfColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColorPicker(
              color: const Color.fromARGB(255, 146, 242, 255),
            ),
            const SizedBox(width: 10),
            ColorPicker(
              color: const Color.fromARGB(255, 255, 135, 175),
            ),
            const SizedBox(width: 10),
            ColorPicker(
              color: const Color.fromARGB(255, 255, 118, 118),
            ),
            const SizedBox(width: 10),
            ColorPicker(
              color: const Color.fromARGB(255, 119, 61, 255),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColorPicker(
              color: const Color.fromARGB(255, 129, 255, 133),
            ),
            const SizedBox(width: 10),
            ColorPicker(
              color: Colors.yellow,
            ),
            const SizedBox(width: 10),
            ColorPicker(
              color: const Color.fromARGB(255, 255, 190, 92),
            ),
            const SizedBox(width: 10),
            ColorPicker(
              color: const Color.fromARGB(255, 255, 58, 229),
            ),
          ],
        ),
      ],
    );
  }
}
