import 'package:birmbenawa/src/models/Screen/daily_reminder_card_data.dart';
import 'package:birmbenawa/src/models/days_checked_provider.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/image_screens.dart';
import 'package:birmbenawa/src/models/Screen/reminder_card_data.dart';
import 'package:birmbenawa/src/provider/time_provider.dart';
import 'package:birmbenawa/src/widgets/time_picker.dart';
import 'package:custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
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
  @override
  ImageProcess process = ImageProcess();
  ImageScreen imageScreen = ImageScreen();
  TextEditingController titleController = TextEditingController();
  TextEditingController controllerData2 = TextEditingController();
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    Color selectedColor = Colors.grey.shade100;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 98, 0, 255),
          title: Text(
            'دانانی ئاگادارکردنەوەی ڕۆژانە',
            style: TextStyle(fontFamily: 'RaberR'),
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
                        style: TextStyle(fontFamily: 'RaberB'),
                        textDirection: TextDirection.rtl,
                        controller: controllerData2,
                        decoration: InputDecoration(
                          hintText: 'زانیاری زیاتر',
                          suffix: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              controllerData2.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 12,
                        ),
                        child: TimePicker(),
                      ),
                    ],
                  ),
                  Container(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 98, 0, 255),
                        ),
                        onPressed: () {
                          setState(() {
                            DailyReminderCardData reminderCardData =
                                DailyReminderCardData(
                              title: titleController.text,
                              descriptionOfCard: controllerData2.text,
                              houre: context.read<TimeProvider>().hour,
                              minute: context.read<TimeProvider>().minute,
                              pmOrAm: context.read<TimeProvider>().pmOrAm,
                              sat: context.read<IsDaysChecked>().satDay,
                              sun: context.read<IsDaysChecked>().sunDay,
                              mon: context.read<IsDaysChecked>().monDay,
                              tue: context.read<IsDaysChecked>().tueDay,
                              wed: context.read<IsDaysChecked>().wedDay,
                              thr: context.read<IsDaysChecked>().thrDay,
                              fri: context.read<IsDaysChecked>().friDay,
                            );
                            debugPrint(
                              '${selectedColor},${context.read<IsDaysChecked>().satDay}, ${context.read<IsDaysChecked>().sunDay}, ${context.read<IsDaysChecked>().monDay}, ${context.read<IsDaysChecked>().tueDay}, ${context.read<IsDaysChecked>().wedDay}, ${context.read<IsDaysChecked>().thrDay}, ${context.read<IsDaysChecked>().friDay}',
                            );
                            final box = Hive.box('dailyReminderCardDatas');
                            box.add(reminderCardData.toMap());
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          'خەزن کردن',
                          style: TextStyle(fontFamily: 'RaberB', fontSize: 20),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  // Future showDialog(context) async {
  //   await AlertDialog(
  //     title: Text('Pick a day'),
  //     content: Padding(
  //       padding: EdgeInsets.all(12),
  //       child: Container(
  //         width: 200,
  //         child: ToggleButtons(
  //             direction: Axis.vertical,
  //             borderColor: Colors.purple,
  //             selectedBorderColor: Colors.pink,
  //             selectedColor: Colors.pink,
  //             borderRadius: BorderRadius.circular(10),
  //             isSelected: isSelectedvalue,
  //             children: [
  //               Text(
  //                 'شەممە',
  //                 style: TextStyle(
  //                   fontFamily: 'RaberB',
  //                   fontSize: 24,
  //                 ),
  //               ),
  //               Text(
  //                 '       ١\n شەممە',
  //                 style: TextStyle(
  //                   fontFamily: 'RaberB',
  //                   fontSize: 24,
  //                 ),
  //               ),
  //               Text(
  //                 '       ٢\n شەممە',
  //                 style: TextStyle(
  //                   fontFamily: 'RaberB',
  //                   fontSize: 24,
  //                 ),
  //               ),
  //               Text(
  //                 '       ٣\n شەممە',
  //                 style: TextStyle(
  //                   fontFamily: 'RaberB',
  //                   fontSize: 24,
  //                 ),
  //               ),
  //               Text(
  //                 '       ٤\n شەممە',
  //                 style: TextStyle(
  //                   fontFamily: 'RaberB',
  //                   fontSize: 24,
  //                 ),
  //               ),
  //               Text(
  //                 '       ٥\n شەممە',
  //                 style: TextStyle(
  //                   fontFamily: 'RaberB',
  //                   fontSize: 24,
  //                 ),
  //               ),
  //               Text(
  //                 'هەینی',
  //                 style: TextStyle(
  //                   fontFamily: 'RaberB',
  //                   fontSize: 24,
  //                 ),
  //               ),
  //             ],
  //             onPressed: (int index) {
  //               setState(() {
  //                 isSelectedvalue[index] = !isSelectedvalue[index];
  //                 switch (index) {
  //                   case 0:
  //                     setState(() {
  //                       context.read<IsDaysChecked>().satChanges(sat: true);
  //                     });
  //                     break;
  //                   case 1:
  //                     setState(() {
  //                       context.read<IsDaysChecked>().sunChanges(sun: true);
  //                     });
  //                     break;
  //                   case 2:
  //                     setState(() {
  //                       context.read<IsDaysChecked>().monChanges(mon: true);
  //                     });
  //                     break;
  //                   case 3:
  //                     setState(() {
  //                       context.read<IsDaysChecked>().tueChanges(tue: true);
  //                     });
  //                     break;
  //                   case 4:
  //                     setState(() {
  //                       context.read<IsDaysChecked>().wedChanges(wed: true);
  //                     });
  //                     break;
  //                   case 5:
  //                     setState(() {
  //                       context.read<IsDaysChecked>().thrChanges(thr: true);
  //                     });
  //                     break;
  //                   case 6:
  //                     setState(() {
  //                       context.read<IsDaysChecked>().friChanges(fri: true);
  //                     });
  //                     break;
  //                 }
  //                 debugPrint('${isSelectedvalue[index]} : $index');
  //               });
  //             }),
  //       ),
  //     ),
  //   );
  // }
}
