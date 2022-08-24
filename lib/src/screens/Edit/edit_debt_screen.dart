import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/image_screens.dart';
import 'package:birmbenawa/src/models/Screen/reminder_card_data.dart';
import 'package:birmbenawa/src/models/time_provider.dart';
import 'package:birmbenawa/src/screens/LandScreen/Landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class EditDebtScreen extends StatefulWidget {
  EditDebtScreen({Key? key}) : super(key: key);

  @override
  State<EditDebtScreen> createState() => _EditDebtScreenState();
}

class _EditDebtScreenState extends State<EditDebtScreen> {
  Icon _icon = Icon(Icons.add);

  //* title - description - time - and save it
  //TODO find the way to increment the key of hive db
  // TODO you can add the packages that you found in Pub.dev
  @override
  Widget build(BuildContext context) {
    ImageProcess process = ImageProcess();
    ImageScreen imageScreen = ImageScreen();
    TextEditingController titleController = TextEditingController();
    TextEditingController controllerData2 = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 98, 0, 255),
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
                        hintText: 'ناوی کەس',
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
                        hintText: 'بڕی قەرزەکە',
                      ),
                    ),
                  ),
                ),
                // DropdownButtonFormField(
                //   value: 1,
                //   items: [
                //   DropdownMenuItem(child: Text('قەرزم کرد')),
                //   DropdownMenuItem(child: Text('قەرزم کرد')),
                // ], onChanged: (value){}),
                //TODO add an Icon picker ( Button to open Icon Dialog )
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 98, 0, 255),
                      ),
                      onPressed: () {
                        // ReminderCardData reminderCardData = ReminderCardData(
                        //   titleController.text,
                        //   controllerData2.text,
                        //   context.read<TimeProvider>().hour,
                        //   context.read<TimeProvider>().minute,
                        //   context.read<TimeProvider>().pmOrAm,
                        // );
                        final box = Hive.box('reminderCardDatas');
                        // box.put('1', reminderCardData.toMap());
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MainPageScreen()));
                      },
                      child: Text(
                        'خەزن کردن',
                        style: TextStyle(fontFamily: 'PeshangBold'),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
