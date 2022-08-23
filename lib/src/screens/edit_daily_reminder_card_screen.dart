import 'package:birmbenawa/src/models/daily_reminder_card_data.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/image_screens.dart';
import 'package:birmbenawa/src/models/reminder_card_data.dart';
import 'package:birmbenawa/src/models/time_provider.dart';
import 'package:birmbenawa/src/provider/days_button_data.dart';
import 'package:birmbenawa/src/screens/LandScreen/Landing_screen.dart';
import 'package:birmbenawa/src/widgets/custom_toggle_button.dart';
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
  bool isDailyReminder = true;

  Icon _icon = Icon(Icons.add);

  bool satDay = false;

  bool sunDay = false;

  bool monDay = false;

  bool tueDay = false;

  bool thrDay = false;

  bool wedDay = false;

  bool friDay = false;

  @override
  Widget build(BuildContext context) {
    ReminderCardData reminderCardData;
    ImageProcess process = ImageProcess();
    ImageScreen imageScreen = ImageScreen();
    TextEditingController titleController = TextEditingController();
    TextEditingController controllerData2 = TextEditingController();
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
                //TODO add time icon to the screen ==> Done
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
                //TODO add title ( text field ) ==> Done
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
                //TODO add description ( text field ) ==> Done
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
                //TODO add time picker ( Button => open time dialog ) ==> Done
                isDailyReminder ? DaysPickerDialogModelWidget() : Container(),
                //TODO add a color picker ( Drop Down Button )

                //TODO add an Icon picker ( Button to open Icon Dialog )
                ElevatedButton(
                    onPressed: () {
                      DailyReminderCardData reminderCardData =
                          DailyReminderCardData(
                        title: titleController.text,
                        descriptionOfCard: controllerData2.text,
                        houre: context.read<TimeProvider>().hour,
                        minute: context.read<TimeProvider>().minute,
                        pmOrAm: context.read<TimeProvider>().pmOrAm,
                        icon: Icons.abc,
                        color: Colors.black,
                        sat: satDay,
                        sun: sunDay,
                        mon: monDay,
                        tue: tueDay,
                        thr: thrDay,
                        wed: wedDay,
                        fri: friDay,
                      );
                      final box = Hive.box('dailyReminderCardDatas');
                      box.put('1', reminderCardData.toMap());
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MainPageScreen()));
                      debugPrint(
                          '$satDay, $sunDay, $monDay, $tueDay, $wedDay, $thrDay, $friDay');
                    },
                    child: Text('Save'))
              ],
            ),
          ),
        ));
  }

  DaysButtonData sat =
      DaysButtonData(color: Colors.black, day: 'شەممە', checked: false);

  DaysButtonData sun =
      DaysButtonData(color: Colors.black, day: 'یەکشەممە', checked: false);

  DaysButtonData mon =
      DaysButtonData(color: Colors.black, day: 'دووشەممە', checked: false);

  DaysButtonData tue =
      DaysButtonData(color: Colors.black, day: 'سێشەممە', checked: false);

  DaysButtonData wed =
      DaysButtonData(color: Colors.black, day: 'چوارشەممە', checked: false);

  DaysButtonData thu =
      DaysButtonData(color: Colors.black, day: 'پێنجشەممە', checked: false);

  DaysButtonData fri =
      DaysButtonData(color: Colors.black, day: 'هەینی', checked: false);

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
              customWidth: 100,
            ),
            const SizedBox(width: 12),
            //! Sun
            CustomToggleButtonWidget(
              textItem: sun.day,
              customHeight: 50,
              customWidth: 100,
            ),
            const SizedBox(width: 12),
            //! Mon
            CustomToggleButtonWidget(
              textItem: mon.day,
              customHeight: 50,
              customWidth: 100,
            ),
            const SizedBox(width: 12),
          ],
        ),
        const SizedBox(width: 12, height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! Tue
            CustomToggleButtonWidget(
              textItem: tue.day,
              customHeight: 50,
              customWidth: 100,
            ),
            const SizedBox(width: 12),
            //! Wed
            CustomToggleButtonWidget(
              textItem: wed.day,
              customHeight: 50,
              customWidth: 100,
            ),
            const SizedBox(width: 12),
            //! Thr
            CustomToggleButtonWidget(
              textItem: thu.day,
              customHeight: 50,
              customWidth: 100,
            ),
          ],
        ),
        const SizedBox(width: 12, height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! Fri
            CustomToggleButtonWidget(
              textItem: fri.day,
              customHeight: 50,
              customWidth: 100,
            ),
          ],
        ),
      ],
    );
  }

  Widget pickIconForMe(BuildContext context) {
    return CustomButtonWidget(
      content: _icon,
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
    _icon = Icon(
      icon,
      size: 40,
    );
    _icon = Icon(icon);
  }
}
