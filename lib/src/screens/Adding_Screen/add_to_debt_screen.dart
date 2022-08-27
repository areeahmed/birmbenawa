import 'package:birmbenawa/src/models/Screen/debt_card_data_model.dart';
import 'package:birmbenawa/src/models/date_picker_provider.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/image_screens.dart';
import 'package:birmbenawa/src/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class EditDebtScreen extends StatefulWidget {
  EditDebtScreen({Key? key}) : super(key: key);

  @override
  State<EditDebtScreen> createState() => _EditDebtScreenState();
}

class _EditDebtScreenState extends State<EditDebtScreen> {
  Icon _icon = Icon(Icons.add);

  //* title - description - time - and save it
  // TODO you can add the packages that you found in Pub.dev
  @override
  Widget build(BuildContext context) {
    ImageProcess process = ImageProcess();
    ImageScreen imageScreen = ImageScreen();
    TextEditingController nameOfTookDebtController = TextEditingController();
    TextEditingController moneyController = TextEditingController();
    String typeOfDebt = 'جۆری قەرز';
    FocusScopeNode currentFocus = FocusScope.of(context);
    final List<String> items = [
      'IQD',
      '\$',
    ];
    List<bool> isSelectedvalue = [
      false,
      false,
    ];
    String typeOfDebtMoney = items.first;

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
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: 'PeshangBold',
                          fontSize: 20,
                        ),
                        controller: nameOfTookDebtController,
                        decoration: InputDecoration(
                          hintText: 'ناوی کەسی پارە بەخشەر',
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 50,
                        width: 100,
                        child: ToggleButtons(
                            borderColor: Color.fromARGB(255, 98, 0, 255),
                            selectedBorderColor: Colors.pink,
                            selectedColor: Colors.pink,
                            borderRadius: BorderRadius.circular(10),
                            isSelected: isSelectedvalue,
                            children: [
                              Text('IQD'),
                              Text('\$'),
                            ],
                            onPressed: (int index) {
                              setState(() {
                                isSelectedvalue[index] =
                                    !isSelectedvalue[index];
                              });
                            }),
                        // child: DropdownButtonFormField(
                        //     value: items.first,
                        //     items: [
                        //       DropdownMenuItem(
                        //           value: 'IQD',
                        //           child: Text('IQD'),
                        //           onTap: (() {
                        //             typeOfDebtMoney = 'IQD';
                        //           })),
                        //       DropdownMenuItem(
                        //           value: '\$',
                        //           child: Text('\$'),
                        //           onTap: (() {
                        //             typeOfDebtMoney = '\$';
                        //           })),
                        //     ],
                        //     onChanged: (value) {
                        //       typeOfDebtMoney = value as String;
                        //     }),
                      ),
                      Container(
                        height: 50,
                        width: 270,
                        padding: const EdgeInsets.only(
                          left: 40,
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontFamily: 'PeshangBold', fontSize: 20),
                            textDirection: TextDirection.rtl,
                            controller: moneyController,
                            decoration: InputDecoration(
                              hintText: 'بڕی قەرزەکە',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButtonFormField(
                        value: 'جۆری قەرز',
                        items: [
                          DropdownMenuItem(
                              value: 'جۆری قەرز',
                              child: Text('جۆری قەرز'),
                              onTap: (() {
                                typeOfDebt = 'جۆری قەرز';
                              })),
                          DropdownMenuItem(
                              value: 'قەرزم کرد',
                              child: Text('قەرزم کرد'),
                              onTap: (() {
                                typeOfDebt = 'قەرزم کرد';
                              })),
                          DropdownMenuItem(
                            value: 'قەرزی کرد',
                            child: Text('قەرزی کرد'),
                            onTap: () {
                              typeOfDebt = 'قەرزی کرد';
                            },
                          ),
                        ],
                        onChanged: (value) {
                          typeOfDebt = value as String;
                        }),
                  ),
                  DatePickerScreen(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 98, 0, 255),
                        ),
                        onPressed: () {
                          if (nameOfTookDebtController.text == '') {
                            nameOfTookDebtController.text = 'Unknown';
                          }
                          DebtCardDataModel debtCardDataModel =
                              DebtCardDataModel(
                                  typeOfDebtMoney: typeOfDebtMoney,
                                  year: context.read<DatePickerProvider>().year,
                                  month:
                                      context.read<DatePickerProvider>().month,
                                  day: context.read<DatePickerProvider>().day,
                                  nameTookDebt: nameOfTookDebtController.text,
                                  debt: int.parse(moneyController.text),
                                  typeOfDebt: typeOfDebt);
                          final box = Hive.box('debt');
                          box.add(debtCardDataModel.toMap());
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'خەزن کردن',
                          style: TextStyle(fontFamily: 'PeshangBold'),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
