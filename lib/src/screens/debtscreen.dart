import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/provider/used_too_mutch.dart';
import 'package:birmbenawa/src/screens/edit_debt_screen.dart';
import 'package:flutter/material.dart';

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
      // body: Container(
      //   padding: EdgeInsets.only(top: 70),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(right: 20.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             Container(
      //               height: 40,
      //               width: 80,
      //               decoration: BoxDecoration(
      //                   border: Border.all(color: Colors.red),
      //                   borderRadius: BorderRadius.circular(5)),
      //               child: Center(
      //                 child: Text(
      //                   '200\$',
      //                   style: TextStyle(color: Colors.red, fontSize: 30),
      //                 ),
      //               ),
      //             ),
      //             SizedBox(
      //               width: 12,
      //             ),
      //             Container(
      //               height: 40,
      //               width: 80,
      //               decoration: BoxDecoration(
      //                   border: Border.all(color: Colors.green),
      //                   borderRadius: BorderRadius.circular(5)),
      //               child: Center(
      //                 child: Text(
      //                   '0\$',
      //                   style: TextStyle(color: Colors.green, fontSize: 30),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       ValueListenableBuilder<Box>(
      //         valueListenable: Hive.box('reminderCardDatas').listenable(),
      //         builder: ((context, box, Widget) {
      //           return box.isEmpty
      //               ? Center(
      //                   child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Image.asset(imageProcess.empty),
      //                     SizedBox(
      //                       height: 12,
      //                     ),
      //                     Text('Screen is Empty')
      //                   ],
      //                 ))
      //               : Expanded(
      //                   child: Container(
      //                     height: 200,
      //                     width: 400,
      //                     color: Colors.grey.shade500,
      //                     child: ListView.builder(
      //                         itemCount: box.length,
      //                         itemBuilder: ((context, index) {
      //                           Map<dynamic, dynamic> _data = box.getAt(index);
      //                           ReminderCardData reminderCardData =
      //                               ReminderCardData.fromMap(
      //                                   _data as Map<dynamic, dynamic>);
      //                           return Container(
      //                             height: 200,
      //                             width: 400,
      //                             color: Colors.grey.shade500,
      //                             child: Column(
      //                               textDirection: TextDirection.rtl,
      //                               children: [
      //                                 Container(
      //                                   height: 200,
      //                                   width: 100000,
      //                                   color: Colors.black,
      //                                   child: Text(
      //                                     reminderCardData.title,
      //                                     textDirection: TextDirection.rtl,
      //                                     style: TextStyle(
      //                                         fontSize: 20,
      //                                         fontFamily: 'PeshangBold'),
      //                                   ),
      //                                 ),
      //                                 SizedBox(
      //                                   height: 12,
      //                                 ),
      //                                 Row(
      //                                   mainAxisAlignment:
      //                                       MainAxisAlignment.spaceAround,
      //                                   children: [
      //                                     Text(
      //                                       '${reminderCardData.houre}:${reminderCardData.minute}',
      //                                     ),
      //                                     Text(reminderCardData
      //                                         .descriptionOfCard),
      //                                   ],
      //                                 ),
      //                                 Row(
      //                                   mainAxisAlignment:
      //                                       MainAxisAlignment.spaceAround,
      //                                   children: [
      //                                     IconButton(
      //                                         onPressed: () {
      //                                           box.delete('1');
      //                                         },
      //                                         icon: Icon(Icons.delete))
      //                                   ],
      //                                 )
      //                               ],
      //                             ),
      //                           );
      //                         })),
      //                   ),
      //                 );
      //         }),
      //       ),
      //     ],
      //   ),
      // ),
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
