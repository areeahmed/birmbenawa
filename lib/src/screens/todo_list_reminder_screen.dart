import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:birmbenawa/src/models/Screen/todo_data_model.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/provider/shop_list_remider_model.dart';
import 'package:birmbenawa/src/screens/Adding_Screen/add_to_do_list_reminder.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class ShopingReminderPage extends StatefulWidget {
  const ShopingReminderPage({Key? key}) : super(key: key);

  @override
  State<ShopingReminderPage> createState() => _ShopingReminderPageState();
}

class _ShopingReminderPageState extends State<ShopingReminderPage> {
  ShopingListRemiderModelClass shopingListReminderModelClass =
      ShopingListRemiderModelClass();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    ImageProcess imageProcess = ImageProcess();
    return Scaffold(
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box('todo').listenable(),
        builder: ((context, box, Widget) {
          List keys = box.keys.cast<int>().toList();
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
                      final key = keys[index];
                      Map<dynamic, dynamic> _data = box.getAt(index);
                      TODO todo = TODO.fromMap(_data as Map<dynamic, dynamic>);
                      return ListTile(
                        onTap: () {
                          showAdaptiveActionSheet(
                            context: context,
                            title: Text('Card Number $key'),
                            androidBorderRadius: 30,
                            actions: <BottomSheetAction>[
                              BottomSheetAction(
                                  title: Text('Delete'),
                                  onPressed: (context) {
                                    box.delete(key);
                                    Navigator.of(context).pop();
                                  }),
                            ],
                            cancelAction: CancelAction(
                                title: const Text(
                                    'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
                          );
                        },
                        leading: Icon(Icons.subject),
                        title: Text(
                          todo.title!,
                          style: todo.isChecked!
                              ? TextStyle(
                                  color: Colors.grey.shade400,
                                  decoration: TextDecoration.lineThrough)
                              : null,
                        ),
                        subtitle: Text(
                          todo.description!,
                          style: todo.isChecked!
                              ? TextStyle(
                                  color: Colors.grey.shade300,
                                  decoration: TextDecoration.lineThrough)
                              : null,
                        ),
                        trailing: MSHCheckbox(
                          size: 30,
                          value: todo.isChecked!,
                          checkedColor: Color.fromARGB(255, 98, 0, 255),
                          style: MSHCheckboxStyle.stroke,
                          onChanged: (selected) {
                            setState(() {
                              todo.isChecked = selected;
                            });
                          },
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
