import 'package:birmbenawa/src/Notifications/notifications.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/image_screens.dart';
import 'package:birmbenawa/src/models/Screen/reminder_card_data.dart';
import 'package:birmbenawa/src/provider/date_picker_provider.dart';
import 'package:birmbenawa/src/provider/time_provider.dart';
import 'package:birmbenawa/src/widgets/time_picker.dart';
import 'package:calender_picker/calender_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
  DateTime dateTime = DateTime.now();

  int days = 31;
  bool isDailyReminder = true;
  Color selectedColor2 = Colors.grey.shade200;
  Icon _icon = Icon(Icons.add);

  @override
  TextEditingController titleController = TextEditingController();
  TextEditingController controllerData2 = TextEditingController();
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    ImageProcess process = ImageProcess();
    ImageScreen imageScreen = ImageScreen();
    Locale arabic = Locale('ar', 'AR');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 98, 0, 255),
          title: Text(
            'دانانی ئاگادارکردنەوەی دیاریکراو',
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text(
                          'ڕۆژێک هەڵبژێرە',
                          style: TextStyle(
                              fontFamily: 'RaberB',
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                        GestureDetector(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SfDateRangePicker(
                                  selectionMode:
                                      DateRangePickerSelectionMode.range,
                                  view: DateRangePickerView.month,
                                  onSelectionChanged: _onSelectionChanged,
                                );
                              }),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0XFFEDF3FF),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Color.fromARGB(255, 98, 0, 255),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  CalenderPicker(
                    dateTime,
                    locale: arabic.toString(),
                    daysCount: days,
                    enableMultiSelection: false,
                    onDateChange: (selectedDate) {
                      context.read<DatePickerProvider>().changeDate(
                          yearNow: selectedDate.year,
                          monthNow: selectedDate.month,
                          dayNow: selectedDate.day);
                      print(selectedDate);
                    },
                    selectionColor: const Color.fromARGB(255, 98, 0, 255),
                    selectedTextColor: Colors.white,
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
                          fontSize: 24,
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
                        style: TextStyle(fontFamily: 'RaberB', fontSize: 24),
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
                            hintStyle:
                                TextStyle(fontFamily: 'RaberB', fontSize: 24)),
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: TimePicker(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 98, 0, 255),
                        ),
                        onPressed: () {
                          if (controllerData2.text != '' &&
                              titleController.text != '') {
                            // snackbar to tell the user that the process is done successfully.
                            final snackBar = SnackBar(
                              duration: Duration(milliseconds: 800),
                              content: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  'جێبەجێکرا',
                                  style: TextStyle(
                                      fontSize: 24, fontFamily: 'RaberR'),
                                ),
                              ),
                              backgroundColor: Colors.green,
                            );
                            // showing snackbar at the bottom of the screen.
                            ScaffoldMessenger.of(context)
                              ..removeCurrentMaterialBanner()
                              ..showSnackBar(snackBar);
                            //--------------------------------
                            NotificationWeekAndTime notificationWeekAndTime =
                                NotificationWeekAndTime(
                              id: createUniqueId(),
                              year: context.read<DatePickerProvider>().year,
                              month: context.read<DatePickerProvider>().month,
                              day: context.read<DatePickerProvider>().day,
                              hour: context.read<TimeProvider>().hour,
                              minute: context.read<TimeProvider>().minute,
                              givenTitle: titleController.text,
                              givenBody: controllerData2.text,
                            );
                            ReminderCardData reminderCardData =
                                ReminderCardData(
                              titleController.text,
                              controllerData2.text,
                              context.read<TimeProvider>().hour,
                              context.read<TimeProvider>().minute,
                              context.read<TimeProvider>().pmOrAm,
                              false,
                              context.read<DatePickerProvider>().year,
                              context.read<DatePickerProvider>().month,
                              context.read<DatePickerProvider>().day,
                              createUniqueId(),
                            );
                            createSpecificScheduledNotification(
                                notificationWeekAndTime);
                            final box = Hive.box('reminderCardDatas');
                            box.add(reminderCardData.toMap());
                            Navigator.of(context).pop();
                          } else {
                            final snackBar = SnackBar(
                              duration: Duration(milliseconds: 800),
                              content: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  'خانەکان بە دروستی پڕبکەوە تکایە',
                                  style: TextStyle(
                                      fontSize: 24, fontFamily: 'RaberR'),
                                ),
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
                          style: TextStyle(fontFamily: 'RaberB', fontSize: 20),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  different({DateTime? first, DateTime? last}) async {
    if (first == null) {
      first = DateTime(2300);
    }
    if (last == null) {
      last = DateTime(3000);
    }
    int data = last.difference(first).inDays;

    setState(() {
      data++;
      days = data;
      print(data);
    });
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      setState(() {
        dateTime = args.value.startDate;

        if (args.value.endDate != null) {
          different(first: args.value.startDate, last: args.value.endDate);
          print(args.value.startDate);
          print(args.value.endDate);
        }
      });
    }
  }

  int createUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(5.remainder(3));
  }
}
