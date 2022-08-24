import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tip_dialog/tip_dialog.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

//TODO adding 2 setting here 1 - app setting 2- profile setting
//* this is for settigns screen not builded yet
class _SettingsPageState extends State<SettingsPage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Hive.openBox('user');
  }

  final box = Hive.box('user');
  final String logoPath = 'assets/images/slider/logo.png';
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 98, 0, 255),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(hintText: '${box.get('name')}'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              box.put('name', name.text);
              Get.snackbar('ناو گۆڕین', 'ناو گۆڕینەکە سەرکەوتوو بوو');
            },
            child: Text('Edit'),
          )
        ],
      ),
    );
  }
}
