import 'package:birmbenawa/firebase_options.dart';
import 'package:birmbenawa/src/models/card_data_provider.dart';
import 'package:birmbenawa/src/models/days_checked_provider.dart';
import 'package:birmbenawa/src/models/time_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Firebase.initializeApp(
    //? Solving Black Screen on Emulator
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final reminderCardbBox = await Hive.openBox('reminderCardDatas');
  final dailyReminderBox = await Hive.openBox('dailyReminderCardDatas');
  final shopingListBox = await Hive.openBox('debt');
  final todoList = await Hive.openBox('todo');
  final userInfo = await Hive.openBox('user');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TimeProvider()),
      ChangeNotifierProvider(create: ((context) => CardDataProvider())),
      ChangeNotifierProvider(create: (context) => IsDaysChecked())
    ],
    child: MyApp(),
  ));
}
