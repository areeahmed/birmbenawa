import 'package:birmbenawa/src/models/Screen/todo_data_model.dart';
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
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      Hive.openBox('todo');
    }

    final box = Hive.box('todo');
    FocusScopeNode currentFocus = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 0, 255),
        centerTitle: true,
        title: Text(
          'دانانی لیست',
          style: TextStyle(
            fontFamily: 'RaberB',
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            currentFocus.unfocus();
          },
          child: Container(
            color: Colors.white,
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
                          hintText: 'ناونیشان',
                          hintStyle: TextStyle(),
                          suffix: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              title.clear();
                            },
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'RaberR',
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
                          hintText: 'زانیاری زیاتر...',
                          hintStyle: TextStyle(),
                          suffix: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              description.clear();
                            },
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'RaberR',
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
                        if (title.text == '' || description.text == '') {
                          final snackBar = SnackBar(
                            content: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                'خانەکان بە دروستی پڕبکەوە تکایە',
                                style: TextStyle(
                                    fontSize: 24, fontFamily: 'RaberR'),
                              ),
                            ),
                            backgroundColor: Colors.red,
                          );
                          // showing snackbar at the bottom of the screen.
                          ScaffoldMessenger.of(context)
                            ..removeCurrentMaterialBanner()
                            ..showSnackBar(snackBar);
                        } else {
                          TODO todo = TODO(
                              title: title.text,
                              description: description.text,
                              isChecked: true);
                          final box = Hive.box('todo');
                          box.add(todo.toMap());
                          Navigator.of(context).pop();
                          final snackBar = SnackBar(
                            content: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                'جێبەجێکرا',
                                style: TextStyle(
                                    fontSize: 24, fontFamily: 'RaberR'),
                              ),
                            ),
                            backgroundColor: Colors.green,
                          );
                          // showing snackbar at the bottom of the screen.
                          ScaffoldMessenger.of(context)
                            ..removeCurrentMaterialBanner()
                            ..showSnackBar(snackBar);
                        }
                      },
                      child: Text(
                        'خەزن کردن',
                        style: TextStyle(fontFamily: 'RaberB'),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
