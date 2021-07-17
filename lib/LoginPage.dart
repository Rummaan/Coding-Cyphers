import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_bas/home.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Provide an email';
                }
              },
              decoration: InputDecoration(labelText: 'Email'),
              onSaved: (input) => _email = input,
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return 'Longer password please';
                }
              },
              decoration: InputDecoration(labelText: 'Password'),
              onSaved: (input) => _password = input,
              obscureText: true,
            ),
            RaisedButton(onPressed: signIn, child: Text('Sign in')),
          ],
        ),
      ),
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        //user.user.sendEmailVerification();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
