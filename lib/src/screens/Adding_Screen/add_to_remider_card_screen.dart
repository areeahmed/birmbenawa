import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/image_screens.dart';
import 'package:birmbenawa/src/models/Screen/reminder_card_data.dart';
import 'package:birmbenawa/src/provider/time_provider.dart';
import 'package:birmbenawa/src/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class EditReminderCardScreen extends StatefulWidget {
  EditReminderCardScreen({
    Key? key,
  })
  //required this.isDailyReminder
  : super(key: key);

  @override
  State<EditReminderCardScreen> createState() => _EditReminderCardScreenState();
}

class _EditReminderCardScreenState extends State<EditReminderCardScreen> {
  bool isDailyReminder = true;
  Color selectedColor2 = Colors.grey.shade200;

  Icon _icon = Icon(Icons.add);
  //* title - description - time - and save it
  //TODO find the way to increment the key of hive db
  // TODO you can add the packages that you found in Pub.dev
  @override
  TextEditingController titleController = TextEditingController();
  TextEditingController controllerData2 = TextEditingController();
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    ImageProcess process = ImageProcess();
    ImageScreen imageScreen = ImageScreen();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 98, 0, 255),
          title: Text(
            'دانانی ئاگادارکردنەوەی ئەمڕۆ',
            style: TextStyle(fontFamily: 'RaberB'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              currentFocus.unfocus();
            },
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
                          fontFamily: 'RaberB',
                          fontSize: 20,
                        ),
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: 'ناونیشان',
                          suffix: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              titleController.clear();
                            },
                          ),
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
                          suffix: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              controllerData2.clear();
                            },
                          ),
                          hintText: 'زانیاری زیاتر',
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
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
                  //TODO add an Icon picker ( Button to open Icon Dialog )
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 98, 0, 255),
                      ),
                      onPressed: () {
                        if (controllerData2.text != '' &&
                            titleController.text != '') {
                          // snackbar to tell the user that the process is done successfully.
                          final snackBar = SnackBar(
                            content: Text(
                              'Successfully Added',
                              style: TextStyle(fontSize: 24),
                            ),
                            backgroundColor: Colors.green,
                          );
                          // showing snackbar at the bottom of the screen.
                          ScaffoldMessenger.of(context)
                            ..removeCurrentMaterialBanner()
                            ..showSnackBar(snackBar);
                          //--------------------------------
                          ReminderCardData reminderCardData = ReminderCardData(
                            titleController.text,
                            controllerData2.text,
                            context.read<TimeProvider>().hour,
                            context.read<TimeProvider>().minute,
                            context.read<TimeProvider>().pmOrAm,
                            true,
                          );
                          final box = Hive.box('reminderCardDatas');
                          box.add(reminderCardData.toMap());
                          Navigator.of(context).pop();
                        } else {
                          final snackBar = SnackBar(
                            content: Text(
                              'Something is Missing',
                              style: TextStyle(fontSize: 24),
                            ),
                            backgroundColor: Colors.red,
                          );
                          // showing snackbar at the bottom of the screen.
                          ScaffoldMessenger.of(context)
                            ..removeCurrentMaterialBanner()
                            ..showSnackBar(snackBar);
                        }
                      },
                      child: Text(
                        'خەزن کردن',
                        style: TextStyle(fontFamily: 'RaberB'),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
