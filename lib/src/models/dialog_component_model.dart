import 'package:birmbenawa/src/components/elevated_button.dart';
import 'package:birmbenawa/src/models/colorPicker.dart';
import 'package:birmbenawa/src/models/days_button_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class DialogComponentModelWidgets {
  String? titleOfCard;
  String? text;
  Widget dialogBody({bool? daysOnOFF}) {
    return Container(
      color: Colors.grey.shade300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey.shade300,
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                //? Entering a title
                titleTextFieldDialogWidget('Enter Title'),
                const SizedBox(
                  height: 10,
                ),
                titleTextFieldDialogWidget('Enter More Detail'),
                const SizedBox(
                  height: 10,
                ),
                TimePicker(),
                const SizedBox(
                  height: 10,
                ),
                //? for selecting ICons ( Icon Picker and showing Icon)
                MyIconpickerWidget(),
                const SizedBox(
                  height: 30,
                ),
                //! Days
                DaysPickerDialogModelWidget(),
                const SizedBox(
                  height: 30,
                ),
                pickCustomColorOfTheCardDialogCompWidget(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SavedElevatedButton(text: 'save'),
              SavedElevatedButton(text: 'cancle'),
            ],
          )
        ],
      ),
    );
  }

  Widget titleTextFieldDialogWidget(String hintedText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintedText,
      ),
      onChanged: (text) {
        if (text == null) {
          titleOfCard = 'Unknown Title';
        } else {
          titleOfCard = text; //! Return to reminder screen
        }
      },
    );
  }

  Widget pickCustomColorOfTheCardDialogCompWidget() {
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

  bool _isElevated = false;
  DaysButtonData sat =
      DaysButtonData(color: Colors.black, day: 'Sat', checked: false);
  DaysButtonData sun =
      DaysButtonData(color: Colors.black, day: 'Sun', checked: false);
  DaysButtonData mon =
      DaysButtonData(color: Colors.black, day: 'Mon', checked: false);
  DaysButtonData tue =
      DaysButtonData(color: Colors.black, day: 'Tue', checked: false);
  DaysButtonData wed =
      DaysButtonData(color: Colors.black, day: 'Wed', checked: false);
  DaysButtonData thu =
      DaysButtonData(color: Colors.black, day: 'Thu', checked: false);
  DaysButtonData fri =
      DaysButtonData(color: Colors.black, day: 'Fri', checked: false);
  @override
  Widget DaysPickerDialogModelWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! Sat
            CustomToggleButtonWidget(
              textItem: sat.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 8),
            //! Sun
            CustomToggleButtonWidget(
              textItem: sun.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 8),
            //! Mon
            CustomToggleButtonWidget(
              textItem: mon.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! Tue
            CustomToggleButtonWidget(
              textItem: tue.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 8),
            //! Wed
            CustomToggleButtonWidget(
              textItem: wed.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 8),
            //! Thu
            CustomToggleButtonWidget(
              textItem: thu.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 8),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! Fri
            CustomToggleButtonWidget(
              textItem: fri.day,
              customHeight: 50,
              customWidth: 50,
              ontap: () {},
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );
  }

  Widget ElevatedButtonDialogWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        child: Text(
          text == '' ? 'text is empty' : text!,
        ), // saveing and creating a card i reminder screen
      ),
    );
  }
}

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
  bool _isElevated = false;
  String? textItem;
  Color? fstColor;
  Color? sndColor;
  Widget? content;
  double? customHeight;
  double? customWidth;
  GestureTapCallback? ontap;
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
                  style: TextStyle(color: fstColor),
                ),
          ),
        ),
      ),
    );
  }
}

class TimePicker extends StatefulWidget {
  TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  int? timeH;
  int? timeM;
  TimeOfDay time = TimeOfDay(hour: 9, minute: 0);
  String getText() {
    if (time == null) {
      return '00:00';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minute = time.minute.toString().padLeft(2, '0');
      timeH = time.hour;
      timeM = time.minute;
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
    return Row(
      children: [
        //? for showing the time
        Text(
          getText(), //! Return to reminder screen
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(
          width: 100,
        ),
        //? Time Picker
        IconButton(
            onPressed: () => pickTime(context), icon: const Icon(Icons.watch)),
      ],
    );
  }
}

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
  Icon? _icon = const Icon(Icons.add);
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
      highlightColor: const Color.fromARGB(255, 167, 167, 167),
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
              offset: const Offset(4, 4),
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
