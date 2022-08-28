import 'package:birmbenawa/firebase_options.dart';
import 'package:birmbenawa/src/models/Screen/todo_data_model.dart';
import 'package:birmbenawa/src/provider/card_data_provider.dart';
import 'package:birmbenawa/src/provider/date_picker_provider.dart';
import 'package:birmbenawa/src/models/days_checked_provider.dart';
import 'package:birmbenawa/src/provider/time_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'src/myapp.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  // initializing the [ WidgetsFlutterBinding ] it is for the [Firebase authentication ]
  WidgetsFlutterBinding.ensureInitialized();
  // [ appDocumentDirectory ] is for documentation for [ Hive DataBase ]

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TODOAdapter());
  await Firebase.initializeApp(
    //? Solving Black Screen on Emulator
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final reminderCardbBox = await Hive.openBox('reminderCardDatas');
  final dailyReminderBox = await Hive.openBox('dailyReminderCardDatas');
  final shopingListBox = await Hive.openBox('debt');
  final todoList = await Hive.openBox('todo');
  final userInfo = await Hive.openBox('user');

  //an instance for local notification plugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  //Android init
  //initialization the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('logo');

  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          onDidReceiveLocalNotification: ((id, title, body, payload) {
    print('on forground: $id');
    print(title);
    print(body);
    print(payload);
  }));

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (value) => print('tapped : ' + value.toString()));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TimeProvider()),
      ChangeNotifierProvider(create: ((context) => CardDataProvider())),
      ChangeNotifierProvider(create: (context) => IsDaysChecked()),
      ChangeNotifierProvider(create: (context) => DatePickerProvider()),
    ],
    child: MyApp(),
  ));
}
