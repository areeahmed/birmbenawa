import 'package:auto_size_text/auto_size_text.dart';
import 'package:birmbenawa/src/models/Screen/daily_reminder_card_data.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/screens/Adding_Screen/add_to_daily_reminder_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/adapters.dart';

class DailyReminderPage extends StatefulWidget {
  const DailyReminderPage({Key? key}) : super(key: key);

  @override
  State<DailyReminderPage> createState() => _DailyReminderPageState();
}

class _DailyReminderPageState extends State<DailyReminderPage> {
  bool isChecked = false;
  ImageProcess imageProcess = ImageProcess();
  @override
  Widget build(BuildContext context) {
    Hive.openBox('dailyReminderCardDatas');
    return Scaffold(
        body: ValueListenableBuilder<Box>(
          valueListenable: Hive.box('dailyReminderCardDatas').listenable(),
          builder: ((context, box, Widget) {
            List<int> keys = box.keys.cast<int>().toList();
            return box.isEmpty
                ? SingleChildScrollView(
                    reverse: true,
                    child: Container(
                      color: Colors.white,
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
                        DailyReminderCardData dailyReminderCardData =
                            DailyReminderCardData.fromMap(
                                _data as Map<dynamic, dynamic>);
                        print('${dailyReminderCardData.sat}');
                        print('${dailyReminderCardData.sun}');
                        print('${dailyReminderCardData.mon}');
                        print('${dailyReminderCardData.tue}');
                        print('${dailyReminderCardData.wed}');
                        print('${dailyReminderCardData.thr}');
                        print('${dailyReminderCardData.fri}');
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  box.delete(key);
                                },
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                              )
                            ],
                          ),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: Offset(-2, 2),
                                    ),
                                  ]),
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.only(bottom: 10),
                              width: 400,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.label,
                                        size: 40,
                                        color: Color.fromARGB(255, 98, 0, 255),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: Text(
                                          dailyReminderCardData.title,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              //! days here
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: dailyReminderCardData
                                                            .sat ==
                                                        true
                                                    ? Text(
                                                        'شەممە',
                                                        style: daysONStyle(),
                                                      )
                                                    : Container(),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: dailyReminderCardData
                                                            .sun ==
                                                        true
                                                    ? Text(
                                                        '١ شەممە',
                                                        style: daysONStyle(),
                                                      )
                                                    : Container(),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: dailyReminderCardData
                                                            .mon ==
                                                        true
                                                    ? Text(
                                                        '٢ شەممە',
                                                        style: daysONStyle(),
                                                      )
                                                    : Container(),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: dailyReminderCardData
                                                            .tue ==
                                                        true
                                                    ? Text(
                                                        '٣ شەممە',
                                                        style: daysONStyle(),
                                                      )
                                                    : Container(),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: dailyReminderCardData
                                                            .wed ==
                                                        true
                                                    ? Text(
                                                        '٤ شەممە',
                                                        style: daysONStyle(),
                                                      )
                                                    : Container(),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: dailyReminderCardData
                                                            .thr ==
                                                        true
                                                    ? Text(
                                                        '٥ شەممە',
                                                        style: daysONStyle(),
                                                      )
                                                    : Container(),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: dailyReminderCardData
                                                            .fri ==
                                                        true
                                                    ? Text(
                                                        'هەینی',
                                                        style: daysONStyle(),
                                                      )
                                                    : Container(),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(right: 150),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        width: 300,
                                        height: 70,
                                        child: Center(
                                          child: AutoSizeText(
                                            dailyReminderCardData
                                                .descriptionOfCard,
                                            style: TextStyle(fontSize: 20),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Switch.adaptive(
                                          activeColor:
                                              Color.fromARGB(255, 98, 0, 255),
                                          inactiveThumbColor:
                                              Color.fromARGB(255, 155, 98, 248),
                                          inactiveTrackColor: Color.fromARGB(
                                              255, 201, 167, 255),
                                          value: _data[key] ?? false,
                                          onChanged: (value) {
                                            setState(() {
                                              if (_data[key] == null) {
                                                _data[key] = true;
                                              }
                                              _data[key] = !_data[key];
                                            });
                                          }),
                                      Text(
                                        '${dailyReminderCardData.houre}:${dailyReminderCardData.minute}',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        );
                      }),
                    ),
                  );
          }),
        ),
        // ReminderCardData remidnerCardData = Rem
        //* Appbar ( LogoIcon - NameOfPageText - DarwerIcon)

        //* Text for greeting the user ( Hello Name of the user that we get from << RegisterPage >>)

        //* ListViewBuilder ==> Showing the cards that user will create and the screen show ( No Card is Created if the list was empty )

        //* Button Action to create a Card

        //* Cards contains ==> ( Title - Description - Time - Icon - color - remining time for reminding)
        floatingActionButton: FloatingActionButton(
            child: const Icon(FontAwesomeIcons.calendarDays),
            heroTag: 'fab2',
            backgroundColor: const Color.fromARGB(255, 98, 0, 255),
            onPressed: () {
              // Hive.box('dailyReminderCardDatas').clear();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditDailyReminderCardScreen(),
              ));
            }));
  }

  TextStyle daysONStyle() {
    return TextStyle(color: Colors.pink);
  }

  TextStyle daysOFFStyle() {
    return TextStyle(color: Colors.pink);
  }
}
