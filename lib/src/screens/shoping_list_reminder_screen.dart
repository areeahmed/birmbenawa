import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/models/reminder_card_data.dart';
import 'package:birmbenawa/src/provider/shop_list_remider_model.dart';
import 'package:birmbenawa/src/screens/Edit/edit_to_do_list_reminder.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShopingReminderPage extends StatefulWidget {
  const ShopingReminderPage({Key? key}) : super(key: key);

  @override
  State<ShopingReminderPage> createState() => _ShopingReminderPageState();
}

class _ShopingReminderPageState extends State<ShopingReminderPage> {
  ShopingListRemiderModelClass shopingListReminderModelClass =
      ShopingListRemiderModelClass();
  @override
  Widget build(BuildContext context) {
    ImageProcess imageProcess = ImageProcess();
    return Scaffold(
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box('shopingListDatas')
            .listenable(), //! ERROR: Box not found. Did you forget to call Hive.openBox()?
        builder: ((context, box, Widget) {
          return box.isEmpty
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imageProcess.empty),
                    SizedBox(
                      height: 12,
                    ),
                    Text('Screen is Empty')
                  ],
                ))
              : Center(
                  child: ListView.builder(
                    itemCount: box.length,
                    itemBuilder: ((context, index) {
                      Map<dynamic, dynamic> _data = box.getAt(index);
                      ReminderCardData reminderCardData =
                          ReminderCardData.fromMap(
                              _data as Map<dynamic, dynamic>);
                      return Container(
                        child: Column(
                          textDirection: TextDirection.rtl,
                          children: [
                            Container(
                              child: Text(
                                reminderCardData.title,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'PeshangBold'),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${reminderCardData.houre}:${reminderCardData.minute}',
                                ),
                                Text(reminderCardData.descriptionOfCard),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      //TODO: How to make the Key will be incremented automatically
                                      box.delete('1');
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditShopingListReminder()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
