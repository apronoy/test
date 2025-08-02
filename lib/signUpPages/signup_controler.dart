import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/FB_Crud_Operation/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupControler extends GetxController {
  // create instance
  static SignupControler get instance => Get.find();

  // variables ..

  final fullname = TextEditingController();
  final phone = TextEditingController();
  final UserName = TextEditingController();
  final Phone = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  //signup method..
  Future<void> createAccount() async {
    try {
      if (email.text.isNotEmpty && password.text.isNotEmpty) {
        _auth
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text)
            .then((value) {
          Get.snackbar('SignUp SuccessFull', '',
              backgroundColor: Colors.blue.withOpacity(0.5),
              colorText: Colors.white,
              duration: Duration(seconds: 2),
              snackPosition: SnackPosition.BOTTOM);

          //clear field ..
          fullname.clear();
          phone.clear();
          email.clear();
          password.clear();
        });
      } else {
        Get.snackbar('SignUp Failed', '',
            backgroundColor: Colors.blue.withOpacity(0.5),
            colorText: Colors.white,
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      print(error);
    }
  }

// Upload user data on firestore ..
  Future<void> uploadData(UserModel user) async {
    final document = _firestore.collection('User').doc();
    user.id = document.id;

    document.set(user.tomap()).then(
      (value) {
        debugPrint('User Upload Successfull');
      },
    ).onError(
      (error, stackTrace) {
        debugPrint('User Upload Successfull .. $error');
      },
    );
  }

  // show user data from firestore ..
  Future<List<UserModel>> showUsers() async {
    final DataStore = await _firestore.collection('User').get();
    List<UserModel> User =
        DataStore.docs.map((user) => UserModel.toModel(user.data())).toList();
    return User;
  } 

  Future<void>UpdateData(String id, Map<String,dynamic>user)async{
    await _firestore.collection('User').doc(id).update(user).then(
      (value) {
        debugPrint('User Updated Successfull');
      },
    ).onError(
      (error, stackTrace) {
        debugPrint('User Updated Failed .. $error');
      },
    );
  }
}
