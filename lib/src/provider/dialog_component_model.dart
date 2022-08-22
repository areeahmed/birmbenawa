// import 'package:birmbenawa/src/models/time_provider.dart';
// import 'package:birmbenawa/src/provider/days_button_data.dart';
// import 'package:birmbenawa/src/widgets/custom_toggle_button.dart';
// import 'package:birmbenawa/src/widgets/time_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class transferred {
//   transferred();

//   TextEditingController titleOfCard = TextEditingController();
//   TextEditingController descriptionOfCard = TextEditingController();

//   String? text;
//   Widget dialogBody({bool? daysOnOFF, required BuildContext context}) {
//     return Container(
//       color: Colors.grey.shade300,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             color: Colors.grey.shade300,
//             margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Save',
//                 ),
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   popDialog(context);
//                 },
//                 child: Text(
//                   'Cancle',
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   popDialog(context) {
//     return Navigator.of(context, rootNavigator: true).pop();
//   }
// }
