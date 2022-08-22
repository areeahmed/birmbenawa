import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/image_screens.dart';
import 'package:birmbenawa/src/models/reminder_card_data.dart';
import 'package:birmbenawa/src/models/time_provider.dart';
import 'package:birmbenawa/src/screens/LandScreen/main_screen.dart';
import 'package:birmbenawa/src/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class EditReminderCardScreen extends StatelessWidget {
  EditReminderCardScreen({
    Key? key,
  })
  //required this.isDailyReminder
  : super(key: key);
  bool isDailyReminder = true;
  @override
  Widget build(BuildContext context) {
    ImageProcess process = ImageProcess();
    ImageScreen imageScreen = ImageScreen();
    TextEditingController titleController = TextEditingController();
    TextEditingController controllerData2 = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'گۆڕینی کات',
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    bottom: 12,
                  ),
                  child: TimePicker(),
                ),
                //TODO add an Icon picker ( Button to open Icon Dialog )
                ElevatedButton(
                    onPressed: () {
                      ReminderCardData reminderCardData = ReminderCardData(
                          titleController.text,
                          controllerData2.text,
                          context.read<TimeProvider>().hour,
                          context.read<TimeProvider>().minute,
                          context.read<TimeProvider>().pmOrAm,
                          Icons.abc,
                          Colors.black);
                      final box = Hive.box('cardDatas');
                      box.put('1', reminderCardData.toMap());
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MainPageScreen()));
                    },
                    child: Text('Save'))
              ],
            ),
          ),
        ));
  }
}
