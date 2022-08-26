import 'package:birmbenawa/src/models/Screen/todo_data_model.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
import 'package:birmbenawa/src/provider/shop_list_remider_model.dart';
import 'package:birmbenawa/src/screens/Adding_Screen/add_to_do_list_reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
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
  Map<String, bool> checkBoxListValue = {};
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    ImageProcess imageProcess = ImageProcess();
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ValueListenableBuilder<Box>(
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
                      Container(
                        margin: EdgeInsets.only(bottom: 25),
                        child: Text(
                          'ئەم بەشە بەتاڵە لە ئێستا دا',
                          style: TextStyle(
                              fontFamily: 'PeshangBold', fontSize: 16),
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
                        final key = keys[index];
                        Map<dynamic, dynamic> _data = box.getAt(index);
                        TODO todo =
                            TODO.fromMap(_data as Map<dynamic, dynamic>);
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
                            child: ListTile(
                              leading: Icon(Icons.subject),
                              title: Text(
                                todo.title!,
                                style: _data[key] ?? false
                                    ? TextStyle(
                                        color: Colors.grey.shade400,
                                        decoration: TextDecoration.lineThrough)
                                    : null,
                              ),
                              subtitle: Text(
                                todo.description!,
                                style: _data[key] ?? false
                                    ? TextStyle(
                                        color: Colors.grey.shade300,
                                        decoration: TextDecoration.lineThrough)
                                    : null,
                              ),
                              trailing: MSHCheckbox(
                                size: 30,
                                value: _data[key] ?? true,
                                checkedColor: Color.fromARGB(255, 98, 0, 255),
                                style: MSHCheckboxStyle.stroke,
                                onChanged: (selected) {
                                  setState(() {
                                    if (_data[key] == null) {
                                      _data[key] = true;
                                    }
                                    _data[key] = !_data[key];
                                    // todo.isChecked = selected;
                                  });
                                },
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
          }),
        ),
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
