import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_bas/loginsignup/logintemplate.dart';

class TeacherDetails extends StatefulWidget {
  @override
  TeacherDetailsState createState() {
    return TeacherDetailsState();
  }
}

class TeacherDetailsState extends State<TeacherDetails> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _fname, _lname;
  final _txtE = TextEditingController();
  final _txtC = TextEditingController();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _obscureTextconfirm = true;
  void _toggleconfirm() {
    setState(() {
      _obscureTextconfirm = !_obscureTextconfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 250,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'First Name',
                      ),
                      onSaved: (input) => _fname = input,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                width: 250,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                      ),
                      onSaved: (input) => _lname = input,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.email), hintText: 'College Email'),
              onSaved: (input) => _email = input,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 500,
                child: TextFormField(
                  controller: _txtE,
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Password should be atleast 6 characters';
                    }
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    hintText: 'Enter Password',
                  ),
                  onSaved: (input) => _password = input,
                  obscureText: _obscureText,
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
            height: 20,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 500,
                child: TextFormField(
                  controller: _txtC,
                  validator: (input) {
                    if (_txtC.text != _txtE.text) {
                      return 'Passwords should match';
                    }
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    hintText: 'Confirm Password',
                  ),
                  obscureText: _obscureTextconfirm,
                ),
              ),
              IconButton(
                onPressed: _toggleconfirm,
                icon: Icon(Icons.remove_red_eye),
                color: Colors.black38,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 50,
            width: 150,
            alignment: Alignment.center,
            margin: EdgeInsets.all(2),
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
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(250, 122, 119, 185),
                      fontWeight: FontWeight.w600),
                ),
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                ),
                onPressed: signup),
          ),
        ],
      ),
    );
  }

  void signup() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        FirebaseFirestore.instance
            .collection('TeacherDetails')
            .add({'name': _fname + ' ' + _lname, 'email': _email});
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);

        user.user.sendEmailVerification(); //Navigator.of(context).pop();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  backgroundColor: Color.fromARGB(250, 122, 119, 185),
                  contentPadding: EdgeInsets.all(50),
                  content: Container(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Sign Up Successful!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 30),
                          FlatButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Logintemp()));
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
      } catch (e) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  backgroundColor: Color.fromARGB(250, 122, 119, 185),
                  contentPadding: EdgeInsets.all(50),
                  content: Container(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Account Already Exists',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 40),
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
