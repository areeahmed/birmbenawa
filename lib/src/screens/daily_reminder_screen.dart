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
                                height: 180,
                                fit: BoxFit.cover,
                                scale: 7,
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
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 10),
                              width: 450,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${dailyReminderCardData.houre}:${dailyReminderCardData.minute}',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: 'RaberB',
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          dailyReminderCardData.title,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'RaberB',
                                          ),
                                        ),
                                      ),
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
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //! days here
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: dailyReminderCardData.sat == true
                                            ? Text(
                                                'شەممە',
                                                style: daysONStyle(),
                                              )
                                            : Container(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: dailyReminderCardData.sun == true
                                            ? Text(
                                                '١ شەممە',
                                                style: daysONStyle(),
                                              )
                                            : Container(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: dailyReminderCardData.mon == true
                                            ? Text(
                                                '٢ شەممە',
                                                style: daysONStyle(),
                                              )
                                            : Container(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: dailyReminderCardData.tue == true
                                            ? Text(
                                                '٣ شەممە',
                                                style: daysONStyle(),
                                              )
                                            : Container(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: dailyReminderCardData.wed == true
                                            ? Text(
                                                '٤ شەممە',
                                                style: daysONStyle(),
                                              )
                                            : Container(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: dailyReminderCardData.thr == true
                                            ? Text(
                                                '٥ شەممە',
                                                style: daysONStyle(),
                                              )
                                            : Container(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: dailyReminderCardData.fri == true
                                            ? Text(
                                                'هەینی',
                                                style: daysONStyle(),
                                              )
                                            : Container(),
                                      ),
                                    ],
                                  )
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
