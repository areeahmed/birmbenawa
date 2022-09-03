import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:birmbenawa/firebase_options.dart';
import 'package:birmbenawa/src/models/Screen/todo_data_model.dart';
import 'package:birmbenawa/src/myapp.dart';
import 'package:birmbenawa/src/provider/card_data_provider.dart';
import 'package:birmbenawa/src/provider/date_picker_provider.dart';
import 'package:birmbenawa/src/provider/time_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

//transfar
void main() async {
  /// this part is for Awesome Notification Package that i have used in my project
  /// here i have created 3 channel the first one is a basic channel that unused yet
  /// the second one is schedule notification for specific date and time for example on [ 3 / 9 / 2022 ] at [ 12 : 45 ] PM
  /// the third one is daily notification it's used to setup a notification for daily for example [ every Sat ] at [ 08 : 00 ] AM
  AwesomeNotifications().initialize(
    // this is the default icon of notification
    'resource://drawable/res_ic_stat_birmbenawa',
    [
      /// basic notification
      /// [channelKey] is the key of notification it should be unique
      /// [channelDescription] this will be more details about this part of notification
      /// [channelName] name of the channel that will shown when user want to active allow receiving notification
      /// [channelShowBadge] showing the badge on the icon of app while receiving notification
      /// [importance] the sound of the notification High - Low - ...
      NotificationChannel(
        channelKey: 'basic_channel',
        channelDescription: '',
        channelName: 'Basic Notification',
        defaultColor: Colors.purple.shade300,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),

      /// basic notification
      /// [channelKey] is the key of notification it should be unique
      /// [channelDescription] this will be more details about this part of notification
      /// [channelName] name of the channel that will shown when user want to active allow receiving notification
      /// [channelShowBadge] showing the badge on the icon of app while receiving notification
      /// [importance] the sound of the notification High - Low - ...
      /// [soundSource] this is for the custom sound that added to the project directory
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

      /// basic notification
      /// [channelKey] is the key of notification it should be unique
      /// [channelDescription] this will be more details about this part of notification
      /// [channelName] name of the channel that will shown when user want to active allow receiving notification
      /// [channelShowBadge] showing the badge on the icon of app while receiving notification
      /// [importance] the sound of the notification High - Low - ...
      /// [soundSource] this is for the custom sound that added to the project directory
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

  // initializing Hive Local Database
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  // registering adapter
  Hive.registerAdapter(TODOAdapter());

  //initializing Firebase and checking the platform
  await Firebase.initializeApp(
    //? Solving Black Screen on Emulator
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // opening the box's of the hive to store data into it
  // this box is for storing Specific Reminder screen data
  final reminderCardbBox = await Hive.openBox('reminderCardDatas');
  // this box is to store daily reminder data
  final dailyReminderBox = await Hive.openBox('dailyReminderCardDatas');
  // this box is to store debt screen data
  final shopingListBox = await Hive.openBox('debt');
  // this box is to store todo screen data
  final todoList = await Hive.openBox('todo');
  //this box is to store user data for example name and phone number
  // and with this he/she can change his/her name
  final userInfo = await Hive.openBox('user');
  runApp(MultiProvider(
    providers: [
      // initializing provider
      ChangeNotifierProvider(create: (context) => TimeProvider()),
      ChangeNotifierProvider(create: ((context) => CardDataProvider())),
      ChangeNotifierProvider(create: (context) => DatePickerProvider()),
    ],
    child: MyApp(),
  ));
}
