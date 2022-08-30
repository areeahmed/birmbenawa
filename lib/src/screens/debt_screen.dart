import 'package:birmbenawa/src/models/Screen/debt_card_data_model.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/screens/Adding_Screen/add_to_debt_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DebtScreenView extends StatefulWidget {
  DebtScreenView({Key? key}) : super(key: key);

  @override
  State<DebtScreenView> createState() => _DebtScreenViewState();
}

class _DebtScreenViewState extends State<DebtScreenView> {
  ImageProcess imageProcess = ImageProcess();
  String? titleOfTheCard;
  String? selectedTime;
  IconData? icon;
  int? timeH;
  int? timeM;
  final developModePathImage = 'assets/images/Developing.png';
  @override
  Widget build(BuildContext context) {
    final user = Hive.box('user').get('name');
    return Scaffold(
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box('debt').listenable(),
        builder: ((context, box, Widget) {
          List<int> keys = box.keys.cast<int>().toList();
          return box.isEmpty
              ? Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Center(
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
                                TextStyle(fontFamily: 'RaberB', fontSize: 20),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Transform.rotate(
                            angle: 6.6,
                            child: Image.asset(
                              'assets/images/arrow.png',
                              height: 200,
                              fit: BoxFit.cover,
                              scale: 6,
                              opacity: AlwaysStoppedAnimation(200),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                )
              : Center(
                  child: ListView.builder(
                    itemCount: box.length,
                    itemBuilder: ((context, index) {
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
                                  Hive.box('debt').delete(key);
                                },
                                icon: Icons.delete,
                                backgroundColor: Colors.red,
                              )
                            ],
                          ),
                          child: Container(
                            color: Colors.grey.shade200,
                            margin: EdgeInsets.only(bottom: 5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      user,
                                      style: TextStyle(
                                          fontFamily: 'RaberR', fontSize: 20),
                                    ),
                                    Icon(debtCardDataModel.typeOfDebt == 1
                                        ? Icons.arrow_back
                                        : Icons.arrow_forward),
                                    Text(
                                      '${debtCardDataModel.nameTookDebt}',
                                      style: TextStyle(
                                          fontFamily: 'RaberR', fontSize: 20),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '${debtCardDataModel.typeOfDebtMoney}',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color:
                                              Color.fromARGB(255, 98, 0, 255)),
                                    ),
                                    Text(
                                      '${debtCardDataModel.debt}',
                                      style: TextStyle(
                                          fontFamily: 'RaberR',
                                          fontSize: 20,
                                          color:
                                              debtCardDataModel.typeOfDebt == 1
                                                  ? Colors.red
                                                  : Colors.green),
                                    ),
                                    Text(
                                      '${debtCardDataModel.year} / ${debtCardDataModel.month} / ${debtCardDataModel.day}',
                                      style: TextStyle(
                                          fontFamily: 'RaberB', fontSize: 20),
                                    )
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
        child: const Icon(Icons.attach_money),
      ),
    );
  }
}
