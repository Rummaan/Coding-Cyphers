import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_bas/admin/suggestwindow.dart';

import 'package:the_bas/dashboard/dboard.dart';
import 'package:the_bas/pagechange/classteach.dart';
import 'package:the_bas/pagechange/splitwo.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailC,
            validator: (input) {
              if (input.isEmpty) {
                return 'Email cannot be Empty';
              }
            },
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter Email id',
            ),
            onSaved: (input) => _email = input,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Container(
                width: (MediaQuery.of(context).size.width) / 3.07,
                alignment: Alignment.center,
                child: TextFormField(
                  controller: passwordC,
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Password should be 6 characters long';
                    }
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    hintText: 'Enter Password',
                  ),
                  obscureText: _obscureText,
                  onSaved: (input) => _password = input,
                ),
              ),
              IconButton(
                onPressed: _toggle,
                icon: Icon(Icons.remove_red_eye),
                color: Colors.black38,
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color.fromARGB(230, 235, 232, 231),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: const Offset(3.0, 5.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  )
                ]),
            child: TextButton(
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(250, 122, 119, 185),
                      fontWeight: FontWeight.w600),
                ),
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                ),
                onPressed: login),
          ),
        ],
      ),
    );
  }

  void login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        print(_email);
        FirebaseFirestore.instance
            .collection('Admin')
            .where('email', isEqualTo: _email)
            .get()
            .then((QuerySnapshot docs) {
          if (docs.docs.isNotEmpty) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SuggestWindow()));
          } else {
            FirebaseFirestore.instance
                .collection('StudentDetails')
                .where('email', isEqualTo: _email)
                .get()
                .then((QuerySnapshot docs) {
              if (docs.docs.isNotEmpty) {
                FirebaseFirestore.instance
                    .collection('StudentDetails')
                    .where('email', isEqualTo: _email)
                    .where('rollno', isEqualTo: 'null')
                    .get()
                    .then((QuerySnapshot docs) {
                  if (docs.docs.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dashboard(title: 'Student')));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Splittwo()));
                  }
                });
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Classes()));
              }
            });
          }
        });
      } catch (e) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  backgroundColor: Color.fromARGB(250, 122, 119, 185),
                  contentPadding: EdgeInsets.all(50),
                  content: Container(
                      height: 140,
                      width: 240,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Account Does not Exist',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Sign Up Now !',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 45),
                          FlatButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(250, 122, 119, 185),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      )));
            });
      }
    }
  }
}
