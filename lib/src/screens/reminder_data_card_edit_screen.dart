import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class ReminderDataEditScreen extends StatefulWidget {
  ReminderDataEditScreen({Key? key}) : super(key: key);

  @override
  State<ReminderDataEditScreen> createState() => _ReminderDataEditScreenState();
}

class _ReminderDataEditScreenState extends State<ReminderDataEditScreen> {
  TimeOfDay time = TimeOfDay(hour: 9, minute: 0);
  String? titleOfTheCard;
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
    setState(() {});
  }

  String getText() {
    if (time == null) {
      return '00:00';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minute = time.minute.toString().padLeft(2, '0');
      return '${hours}:${minute}';
    }
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newDate = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: time,
    );

    if (newDate == null) return;

    setState(() => time = newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 230, 230, 230),
              ),
              margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter the title'),
                    onChanged: (text) {
                      if (text == null) {
                        titleOfTheCard = 'Unknown Title';
                      } else {
                        titleOfTheCard = text;
                      }
                    },
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'More Description'),
                    onChanged: (text) {
                      if (text == null) {
                        titleOfTheCard = 'Unknown Title';
                      } else {
                        titleOfTheCard = text;
                      }
                    },
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Text(
                        getText(),
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      IconButton(
                          onPressed: () => pickTime(context),
                          icon: Icon(Icons.watch)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(microseconds: 300),
                        child: _icon ??
                            Container(
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            ),
                      ),
                      SizedBox(
                        width: 145,
                      ),
                      IconButton(
                        onPressed: _pickIcon,
                        icon: Icon(Icons.list),
                        iconSize: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
