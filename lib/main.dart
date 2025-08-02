import 'package:firebase/FB_Crud_Operation/Products_Data/ToDoApp.dart';
import 'package:firebase/firebase_options.dart';
import 'package:firebase/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(
    home: const home(),
    title: '1st App on Firebase',
    debugShowCheckedModeBanner: false,
  ));
}
