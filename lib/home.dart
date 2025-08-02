import 'package:firebase/FB_Crud_Operation/Elebutton.dart';
import 'package:firebase/FB_Crud_Operation/Products_Data/ToDoApp.dart';
import 'package:firebase/FB_Crud_Operation/Products_Data/Data_controler.dart';
import 'package:firebase/FB_Crud_Operation/Products_Data/Upload_product.dart';
import 'package:firebase/FB_Crud_Operation/User_Data/show_users.dart';
import 'package:firebase/signUpPages/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    final controler = Get.put(DataControler());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "  Firebase FireStore !!",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            EleButton(
                name: 'To Do App',
                onpressed: () {
                  Get.to(const ToDoApp());
                }),
            SizedBox(height: 20),
            EleButton(
                name: ' Create User ',
                onpressed: () {
                  Get.to(Signuppage());
                }),
            SizedBox(height: 20),
            EleButton(
                name: 'Show User ',
                onpressed: () {
                  Get.to(ShowUsers());
                }),
          ],
        ),
      ),
    );
  }
}
