import 'package:birmbenawa/src/models/daily_reminder_card_data.dart';
import 'package:birmbenawa/src/models/days_checked_provider.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/image_screens.dart';
import 'package:birmbenawa/src/models/reminder_card_data.dart';
import 'package:birmbenawa/src/models/time_provider.dart';
import 'package:birmbenawa/src/screens/LandScreen/Landing_screen.dart';
import 'package:birmbenawa/src/widgets/icon_picker.dart';
import 'package:birmbenawa/src/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class EditDailyReminderCardScreen extends StatefulWidget {
  EditDailyReminderCardScreen({
    Key? key,
  })
  //required this.isDailyReminder
  : super(key: key);

  @override
  State<EditDailyReminderCardScreen> createState() =>
      _EditDailyReminderCardScreenState();
}

class _EditDailyReminderCardScreenState
    extends State<EditDailyReminderCardScreen> {
  List<bool> isSelectedvalue = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  bool isDailyReminder = true;
  Color selectedColor = Colors.grey.shade100;
  IconData? _icon;
  @override
  Widget build(BuildContext context) {
    ReminderCardData reminderCardData;
    ImageProcess process = ImageProcess();
    ImageScreen imageScreen = ImageScreen();
    TextEditingController titleController = TextEditingController();
    TextEditingController controllerData2 = TextEditingController();
    Color selectedColor = Colors.grey.shade100;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'گۆڕینی کاتی ڕۆژانە',
            style: TextStyle(fontFamily: 'PeshangBold'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  imageScreen.editScreen,
                  height: 250,
                  width: 250,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                    bottom: 12,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'PeshangBold',
                        fontSize: 20,
                      ),
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'ناونیشان',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      style: TextStyle(fontFamily: 'PeshangBold'),
                      textDirection: TextDirection.rtl,
                      controller: controllerData2,
                      decoration: InputDecoration(
                        hintText: 'زانیاری زیاتر',
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: pickIconForMe(context),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                        bottom: 12,
                      ),
                      child: TimePicker(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DropdownButtonFormField<Color>(
                    value: selectedColor,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Blue',
                          style: TextStyle(color: Colors.lightBlueAccent),
                        ),
                        value: selectedColor,
                        onTap: (() {
                          setState(() {
                            debugPrint('the color is Blue');
                            selectedColor = Colors.lightBlueAccent;
                          });
                        }),
                      ),
                      DropdownMenuItem(
                        child: Text('Pink',
                            style:
                                TextStyle(color: Colors.pinkAccent.shade100)),
                        value: Colors.pinkAccent.shade100,
                        onTap: (() {
                          setState(() {
                            debugPrint('the color is Pink');
                            selectedColor = Colors.pinkAccent.shade100;
                          });
                        }),
                      ),
                      DropdownMenuItem(
                        child: Text('Red',
                            style: TextStyle(color: Colors.redAccent.shade100)),
                        value: Colors.redAccent.shade100,
                        onTap: (() {
                          setState(() {
                            debugPrint('the color is Red');
                            selectedColor = Colors.redAccent.shade100;
                          });
                        }),
                      ),
                      DropdownMenuItem(
                        child: Text('Purple',
                            style:
                                TextStyle(color: Colors.purpleAccent.shade100)),
                        value: Colors.purpleAccent.shade100,
                        onTap: (() {
                          setState(() {
                            debugPrint('the color is Purple');
                            selectedColor = Colors.purpleAccent.shade100;
                          });
                        }),
                      ),
                      DropdownMenuItem(
                        child: Text('Green',
                            style: TextStyle(color: Colors.greenAccent)),
                        value: Colors.greenAccent,
                        onTap: (() {
                          setState(() {
                            debugPrint('the color is Green');
                            selectedColor = Colors.greenAccent;
                          });
                        }),
                      ),
                      DropdownMenuItem(
                        child: Text('Yellow',
                            style:
                                TextStyle(color: Colors.yellowAccent.shade400)),
                        value: Colors.yellowAccent.shade100,
                        onTap: (() {
                          setState(() {
                            debugPrint('the color is Yellow');
                            selectedColor = Colors.yellowAccent.shade100;
                          });
                        }),
                      ),
                      DropdownMenuItem(
                        child: Text('Orange',
                            style:
                                TextStyle(color: Colors.orangeAccent.shade200)),
                        value: Colors.orangeAccent.shade200,
                        onTap: (() {
                          setState(() {
                            debugPrint('the color is Orange');
                            selectedColor = Colors.orangeAccent.shade200;
                          });
                        }),
                      ),
                    ],
                    onChanged: ((value) {}),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: ToggleButtons(
                      borderColor: Colors.purple,
                      selectedBorderColor: Colors.pink,
                      selectedColor: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                      isSelected: isSelectedvalue,
                      children: [
                        Text('sat'),
                        Text('sun'),
                        Text('mon'),
                        Text('tue'),
                        Text('wed'),
                        Text('thr'),
                        Text('fri'),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          isSelectedvalue[index] = !isSelectedvalue[index];
                          switch (index) {
                            case 0:
                              setState(() {
                                context
                                    .read<IsDaysChecked>()
                                    .satChanges(sat: true);
                              });
                              break;
                            case 1:
                              setState(() {
                                context
                                    .read<IsDaysChecked>()
                                    .sunChanges(sun: true);
                              });
                              break;
                            case 2:
                              setState(() {
                                context
                                    .read<IsDaysChecked>()
                                    .monChanges(mon: true);
                              });
                              break;
                            case 3:
                              setState(() {
                                context
                                    .read<IsDaysChecked>()
                                    .tueChanges(tue: true);
                              });
                              break;
                            case 4:
                              setState(() {
                                context
                                    .read<IsDaysChecked>()
                                    .wedChanges(wed: true);
                              });
                              break;
                            case 5:
                              setState(() {
                                context
                                    .read<IsDaysChecked>()
                                    .thrChanges(thr: true);
                              });
                              break;
                            case 6:
                              setState(() {
                                context
                                    .read<IsDaysChecked>()
                                    .friChanges(fri: true);
                              });
                              break;
                          }
                          debugPrint('${isSelectedvalue[index]}');
                        });
                      }),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        DailyReminderCardData reminderCardData =
                            DailyReminderCardData(
                          title: titleController.text,
                          descriptionOfCard: controllerData2.text,
                          houre: context.read<TimeProvider>().hour,
                          minute: context.read<TimeProvider>().minute,
                          pmOrAm: context.read<TimeProvider>().pmOrAm,
                          icon: _icon,
                          color: selectedColor,
                          sat: context.read<IsDaysChecked>().satDay,
                          sun: context.read<IsDaysChecked>().sunDay,
                          mon: context.read<IsDaysChecked>().monDay,
                          tue: context.read<IsDaysChecked>().tueDay,
                          wed: context.read<IsDaysChecked>().wedDay,
                          thr: context.read<IsDaysChecked>().thrDay,
                          fri: context.read<IsDaysChecked>().friDay,
                        );
                        final box = Hive.box('dailyReminderCardDatas');
                        box.put('1', reminderCardData.toMap());
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MainPageScreen()));
                        debugPrint(
                            '${context.read<IsDaysChecked>().satDay}, ${context.read<IsDaysChecked>().satDay}, ${context.read<IsDaysChecked>().satDay}, ${context.read<IsDaysChecked>().satDay}, ${context.read<IsDaysChecked>().satDay}, ${context.read<IsDaysChecked>().satDay}, ${context.read<IsDaysChecked>().satDay}');
                      });
                    },
                    child: Text('Save'))
              ],
            ),
          ),
        ));
  }

  Widget pickIconForMe(BuildContext context) {
    return CustomButtonWidget(
      content: Icon(_icon),
      customHeight: 50,
      customWidth: 50,
      ontap: () => _pickIcon(context),
    );
  }

  _pickIcon(context) async {
    IconData? icon = await FlutterIconPicker.showIconPicker(
      iconSize: 30,
      context,
      iconPackModes: [IconPack.cupertino],
    );
    setState(() {
      _icon = icon;
    });
  }
}
