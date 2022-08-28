import 'package:birmbenawa/src/models/Screen/todo_data_model.dart';
import 'package:birmbenawa/src/models/image_process_model.dart';
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
                          style: TextStyle(fontFamily: 'RaberB', fontSize: 20),
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
                            margin: EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: Offset(-1, 1))
                                ]),
                            child: ListTile(
                              leading: Icon(
                                Icons.label,
                                color: _data[key] ?? false
                                    ? Colors.black
                                    : Color.fromARGB(255, 98, 0, 255),
                              ),
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
                                        fontFamily: 'RaberB',
                                        color: Colors.grey.shade300,
                                        decoration: TextDecoration.lineThrough)
                                    : TextStyle(fontFamily: 'RaberB'),
                              ),
                              trailing: MSHCheckbox(
                                size: 30,
                                value: _data[key] ?? false,
                                checkedColor: Color.fromARGB(255, 98, 0, 255),
                                style: MSHCheckboxStyle.fillFade,
                                onChanged: (selected) {
                                  setState(() {
                                    if (_data[key] == null) {
                                      _data[key] = true;
                                    }
                                    _data[key] = !_data[key];
                                    bool checked = _data[key];

                                    box.put(key, _data);
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
          // Hive.box('todo').clear();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditShopingListReminder()));
        },
        child: const Icon(Icons.list),
      ),
    );
  }
}
