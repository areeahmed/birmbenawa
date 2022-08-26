import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:birmbenawa/src/models/Screen/debt_card_data_model.dart';
import 'package:birmbenawa/src/models/date_picker_provider.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/provider/used_too_mutch.dart';
import 'package:birmbenawa/src/screens/Adding_Screen/add_to_debt_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:birmbenawa/src/models/Screen/daily_reminder_card_data.dart';
import 'package:provider/provider.dart';

class DebtScreenView extends StatefulWidget {
  DebtScreenView({Key? key}) : super(key: key);

  @override
  State<DebtScreenView> createState() => _DebtScreenViewState();
}

//! this screen is on developing
class _DebtScreenViewState extends State<DebtScreenView> {
  ImageProcess imageProcess = ImageProcess();
  UsedTooMutch usedTooMutch = UsedTooMutch();
  String? titleOfTheCard;
  String? selectedTime;
  IconData? icon;
  int? timeH;
  int? timeM;
  final developModePathImage = 'assets/images/Developing.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box('debt').listenable(),
        builder: ((context, box, Widget) {
          List<int> keys = box.keys
              .cast<int>()
              .toList(); //! ERROR: type 'String' is not a subtype of type 'int' in type cast
          return box.isEmpty
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imageProcess.empty),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 25),
                      child: Text(
                        'ئەم بەشە بەتاڵە لە ئێستا دا',
                        style:
                            TextStyle(fontFamily: 'PeshangBold', fontSize: 16),
                      ),
                    ),
                    Transform.rotate(
                      angle: 6.6,
                      child: Image.asset(
                        'assets/images/arrow.png',
                        height: 200,
                        fit: BoxFit.cover,
                        scale: 6,
                        opacity: AlwaysStoppedAnimation(200),
                      ),
                    ),
                  ],
                ))
              : Center(
                  child: ListView.builder(
                    itemCount: box.length,
                    itemBuilder: ((context, index) {
                      int year = context.watch<DatePickerProvider>().year;
                      int month = context.watch<DatePickerProvider>().month;
                      int day = context.watch<DatePickerProvider>().day;
                      final key = keys[index];
                      Map<dynamic, dynamic> _data = box.getAt(index);
                      DebtCardDataModel debtCardDataModel =
                          DebtCardDataModel.fromMap(
                              _data as Map<dynamic, dynamic>);
                      return Slidable(
                          endActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  Hive.box('debt').clear();
                                },
                                icon: Icons.delete,
                              )
                            ],
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('${debtCardDataModel.nameTookDebt}'),
                                    Icon(Icons.arrow_back),
                                    Text(debtCardDataModel.nameGiveDebt),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('${debtCardDataModel.debt}'),
                                    Text('$year / $month / $day')
                                  ],
                                )
                              ],
                            ),
                          ));
                    }),
                  ),
                );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab4',
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => EditDebtScreen()))),
        child: const Icon(Icons.add),
      ),
    );
  }
}
