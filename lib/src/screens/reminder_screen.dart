import 'package:auto_size_text/auto_size_text.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/Screen/reminder_card_data.dart';
import 'package:birmbenawa/src/screens/Adding_Screen/add_to_remider_card_screen.dart';
// import 'package:birmbenawa/src/service/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Reminderpage extends StatefulWidget {
  Reminderpage({Key? key}) : super(key: key);
  @override
  State<Reminderpage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<Reminderpage> {
  // late final LocalNotificationService service;

  // @override
  // void initState() {
  //   service = LocalNotificationService();
  //   service.initialize();
  //   // TODO: implement initState
  //   super.initState();
  // }

  ImageProcess imageProcess = ImageProcess();
  @override
  Widget build(BuildContext context) {
    // final cardDataBox = Hive.box('reminderCardDatas');
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ValueListenableBuilder<Box>(
          valueListenable: Hive.box('reminderCardDatas').listenable(),
          builder: ((context, box, Widget) {
            List keys = box.keys.cast<int>().toList();
            return box.isEmpty
                ? SingleChildScrollView(
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
                              height: 180,
                              fit: BoxFit.cover,
                              scale: 7,
                              opacity: AlwaysStoppedAnimation(200),
                            ),
                          ),
                        ),
                      ],
                    )),
                  )
                : Center(
                    child: ListView.builder(
                        itemCount: box.length,
                        itemBuilder: ((context, index) {
                          final key = keys[index];
                          Map<dynamic, dynamic> _data = box.getAt(index);
                          ReminderCardData reminderCardData =
                              ReminderCardData.fromMap(
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
                                          '${reminderCardData.houre.toString().padLeft(2, '0')}:${reminderCardData.minute.toString().padLeft(2, '0')}',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'RaberB'),
                                        ),
                                        Container(
                                          child: Text(
                                            reminderCardData.title,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontFamily: 'RaberB'),
                                          ),
                                        ),
                                        Switch.adaptive(
                                            activeColor:
                                                Color.fromARGB(255, 98, 0, 255),
                                            inactiveThumbColor: Color.fromARGB(
                                                255, 155, 98, 248),
                                            inactiveTrackColor: Color.fromARGB(
                                                255, 201, 167, 255),
                                            value: _data[key] ?? true,
                                            onChanged: (value) {
                                              setState(() {
                                                if (_data[key] == null) {
                                                  _data[key] = true;
                                                }
                                                _data[key] = !_data[key];
                                              });
                                            })
                                      ],
                                    ),
                                  ],
                                )),
                          );
                        })),
                  );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab1',
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
        onPressed: () {
          //TODO it should show the notification

          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => EditReminderCardScreen())));
        },
        child: const Icon(Icons.notification_add),
      ),
    );
  }
}
