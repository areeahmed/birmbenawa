import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:birmbenawa/firebase_options.dart';
import 'package:birmbenawa/src/models/Screen/todo_data_model.dart';
import 'package:birmbenawa/src/myapp.dart';
import 'package:birmbenawa/src/provider/card_data_provider.dart';
import 'package:birmbenawa/src/provider/date_picker_provider.dart';
import 'package:birmbenawa/src/models/days_checked_provider.dart';
import 'package:birmbenawa/src/provider/time_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

//transfar
void main() async {
  AwesomeNotifications().initialize(
    'resource://drawable/res_ic_stat_birmbenawa',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelDescription: '',
        channelName: 'Basic Notification',
        // the android notification icon color
        defaultColor: Colors.purple.shade300,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notification',
        channelDescription: '',
        defaultColor: Colors.purple.shade300,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        locked: true,
        soundSource: 'resource://raw/res_notification_soubd',
      ),
      NotificationChannel(
        channelKey: 'daily_scheduled_channel',
        channelName: 'Daily Scheduled Notification',
        channelDescription: '',
        defaultColor: Colors.purple.shade300,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        locked: true,
        soundSource: 'resource://raw/res_notification_soubd',
      ),
    ],
  );
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
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TimeProvider()),
      ChangeNotifierProvider(create: ((context) => CardDataProvider())),
      ChangeNotifierProvider(create: (context) => IsDaysChecked()),
      ChangeNotifierProvider(create: (context) => DatePickerProvider()),
    ],
    child: MyApp(),
  ));

  // this is the safest Project for Undoing commit any thing happen undo commit until here or delete the local project and clone this commit
}
