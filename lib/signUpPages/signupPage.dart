import 'package:firebase/FB_Crud_Operation/Elebutton.dart';
import 'package:firebase/FB_Crud_Operation/model/user_model.dart';
import 'package:firebase/signUpPages/signup_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signuppage extends StatelessWidget {
  const Signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    final controler = Get.put(SignupControler());
    return Scaffold(
      appBar: AppBar(title: Text('Firebase SignUp')),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            height: 500,
            color: Colors.blue.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // heading ..
                const Text('SignUp Page',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(height: 50),
                // email ...
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: controler.fullname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Full Name'),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: controler.phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Phone'),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: controler.email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Email'),
                  ),
                ),
                SizedBox(height: 15),
                // password ...
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: controler.password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 20),

                EleButton(
                    name: 'Submit',
                    onpressed: () {
                      controler.createAccount();
                      // to save data on cloude store ...
                      controler.uploadData(UserModel(
                          fullname: controler.fullname.text,
                          phone: controler.phone.text,
                          email: controler.email.text,
                          password: controler.password.text,
                          id: ''));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
