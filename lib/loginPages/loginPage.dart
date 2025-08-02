import 'package:firebase/loginPages/login_controler.dart';
import 'package:firebase/signUpPages/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final controler = Get.put(LoginControler());
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Login')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 500,
          color: Colors.blue.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // heading ..
              const Text('Login Page',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              SizedBox(height: 50),
              // email ...
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: controler.email,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
              ),
              SizedBox(height: 15),
              // password ...
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: controler.password,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: controler.loginUser,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Colors.blue.withOpacity(0.7)),
              ),
              SizedBox(height: 10),

              IconButton(
                  onPressed: controler.googleSignin,
                  icon: SizedBox(
                      height: 50, child: Image.asset('assets/google.png'))),

              TextButton(
                  onPressed: () {
                    Get.to(() => Signuppage());
                  },
                  child: Text('SignIn'))
            ],
          ),
        ),
      ),
    );
  }
}
