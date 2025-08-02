import 'package:firebase/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var email = TextEditingController();
  var pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amber,
          height: 500,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hader(),
              textfield(),
              btn(),
            ],
          ),
        ),
      ),
    );
  }
//header ,,

  Widget hader() {
    return Container(
      child: Column(
        children: [
          Text(
            'Sign Up ',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(width: 200, child: Divider())
        ],
      ),
    );
  }
  
// Email and password text field ...
  Widget textfield() {
    return Container(
      width: 300,
      child: Column(
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(hintText: " Enter E-mail "),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: pass,
            obscureText: true,
            decoration: InputDecoration(
              hintText: " Enter Password",
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  // Submit and Clear button .. 

  Widget btn() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                setState(() {
                  email.clear();
                  pass.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                      side: BorderSide(color: Colors.black))),
              child: Text('Clear')),
          SizedBox(
            width: 30,
          ),
          TextButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                      side: BorderSide(color: Colors.black))),
              onPressed: () {
                try {
                  var umail = email.text.toString();
                  var upass = pass.text.toString();

                  if (umail.isNotEmpty && upass.isNotEmpty) {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: umail, password: upass)
                        .then((value) {
                      print('User Successfully added');
                    }).onError(
                      (error, stackTrace) {
                        print(error.toString());
                      },
                    );
                  } else {
                    print('Email or password empty');
                  }
                } catch (er) {}
                setState(() {
                  email.clear();
                  pass.clear();
                });
              },
              child: Text('Sign Up')),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
