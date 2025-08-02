import 'package:firebase/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginControler extends GetxController {
  // variables
  final email = TextEditingController();
  final password = TextEditingController();
  final _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {
    try {
      if (email.text.isNotEmpty && password.text.isNotEmpty) {
        _auth
            .signInWithEmailAndPassword(
                email: email.text.trim(), password: password.text.trim())
            .then((e) async {
          Get.snackbar('Login SuccessFull', '',
              backgroundColor: Colors.blue.withOpacity(0.5),
              colorText: Colors.white,
              duration: Duration(seconds: 2),
              snackPosition: SnackPosition.BOTTOM);
          Get.to(home());

          // to save data locally help of shared prefarance ...

          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool('isUserLogin', true);
        }).onError(
          (error, stackTrace) {
            Get.snackbar('$error !!', '$stackTrace',
                backgroundColor: Colors.blue.withOpacity(0.5),
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM);
          },
        );
      } else {
        Get.snackbar('Warning  !!', ' Email and Password is Empty !!!!',
            backgroundColor: Colors.blue.withOpacity(0.5),
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // sign in with google ..

  Future<void> googleSignin() async {
    //  select account or choose google account ..
    final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
    //verification account ..
    final GoogleSignInAuthentication? googleauth =
        await userAccount?.authentication;
    // get cradentials
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleauth!.accessToken,
      idToken: googleauth.idToken,
    );
    //signinwith credentials ..
    await _auth.signInWithCredential(credential).then((value) async {
      Get.snackbar('Login SuccessFull', '',
          backgroundColor: Colors.blue.withOpacity(0.5),
          colorText: Colors.white,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);

      Get.to(home());
      // to save data locally help of shared prefarance ...

      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('isUserLogin', true);
    }).onError((error, stackTrace) {
      Get.snackbar(' Ops Login failed ', '$error',
          backgroundColor: Colors.blue.withOpacity(0.5),
          colorText: Colors.white,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
