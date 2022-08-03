import 'package:birmbenawa/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //? Solving Black Screen on Emulator
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
