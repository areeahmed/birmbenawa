import 'package:birmbenawa/firebase_options.dart';
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
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => TimeProvider())],
    child: MyApp(),
  ));

  final cardDataBox = await Hive.openBox('cardDatas');
}//18
