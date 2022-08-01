import 'package:birmbenawa/src/components/checkboxlist.dart';
import 'package:flutter/material.dart';

class ListTileWidgetComponent extends StatefulWidget {
  ListTileWidgetComponent({Key? key}) : super(key: key);

  @override
  State<ListTileWidgetComponent> createState() =>
      _ListTileWidgetComponentState();
}

class _ListTileWidgetComponentState extends State<ListTileWidgetComponent> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedTextColor: Color.fromARGB(255, 98, 0, 255),
      leading: Icon(
        Icons.call,
      ),
      title: Text('Title'),
      subtitle: Text('more detail'),
      children: [
        Container(
          child: Row(children: [
            buildCheckBox(),
            Text(
              'Your Task is Here...',
              style: TextStyle(
                color: value! ? Colors.grey.shade600 : Colors.black,
                decorationThickness: 4,
                decoration: value! ? TextDecoration.lineThrough : null,
              ),
            ),
          ]),
        ),
        Container(
          child: Row(children: [
            buildCheckBox(),
            Text(
              'Your Task is Here...',
              style: TextStyle(
                color: value! ? Colors.grey.shade600 : Colors.black,
                decorationThickness: 4,
                decoration: value! ? TextDecoration.lineThrough : null,
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget buildCheckBox() => CheckBoxBuildWidget();
}
