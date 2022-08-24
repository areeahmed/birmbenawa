import 'package:birmbenawa/src/models/Screen/reminder_card_data.dart';
import 'package:birmbenawa/src/models/Screen/todo_data_model.dart';
import 'package:birmbenawa/src/screens/LandScreen/Landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EditShopingListReminder extends StatefulWidget {
  const EditShopingListReminder({Key? key}) : super(key: key);

  @override
  State<EditShopingListReminder> createState() =>
      _EditShopingListReminderState();
}

class _EditShopingListReminderState extends State<EditShopingListReminder> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      Hive.openBox('todo');
    }

    final box = Hive.box('todo');
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 0, 255),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/images/List_Of_Task.png'),
              ),
              SizedBox(
                height: 8,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                        hintText: 'ناونیشان', hintStyle: TextStyle()),
                    style: TextStyle(
                      fontFamily: 'PeshangBold',
                      fontSize: 20,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: description,
                    decoration: InputDecoration(
                        hintText: 'زانیاری زیاتر...', hintStyle: TextStyle()),
                    style: TextStyle(
                      fontFamily: 'PeshangBold',
                      fontSize: 20,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 98, 0, 255),
                  ),
                  onPressed: () {
                    TODO todo = TODO(
                        title: title.text,
                        description: description.text,
                        isChecked: false);
                    final box = Hive.box('todo');
                    box.add(todo.toMap());
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'خەزن کردن',
                    style: TextStyle(fontFamily: 'PeshangBold'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
