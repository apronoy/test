import 'dart:async';

import 'package:firebase/home.dart';
import 'package:firebase/loginPages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () async {
      // firebase check current user in or out ..

      // final _auth = FirebaseAuth.instance;
      // if (_auth.currentUser != null) {
      //   print(_auth.currentUser.toString());

      //   Get.to(const home());
      // } else {
      //   Get.to(const Loginpage());
      // }

      // local storage ..
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.getBool('isUserLogin') != null &&
          pref.getBool('isUserLogin') != false) {
        Get.to(home());
      } else {
        Get.to(Loginpage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/splash.png', fit: BoxFit.cover)),
    );
  }
}
