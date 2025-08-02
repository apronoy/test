import 'package:firebase/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
              signup1(),
            ],
          ),
        ),
      ),
    );
  }

  Widget hader() {
    return Container(
      child: Column(
        children: [
          Text(
            'Log In ',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(width: 200, child: Divider())
        ],
      ),
    );
  }

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
                var uemail = email.text.toString();
                var upass = pass.text.toString();
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(email: uemail, password: upass)
                    .then((v) {
                  print('Login Success');
                }).onError(
                  (e, stackTrace) {
                    print(e.toString());
                  },
                );
              },
              child: Text('Log In')),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }

  Widget signup1() {
    return Container(
      child: Column(
        children: [
          InkWell(
            child: Text(
              'SignUp',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) => signup()));
            },
          )
        ],
      ),
    );
  }
}
