import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bas/authentication_service.dart';
import 'package:the_bas/signUp.dart';

import 'LoginPage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(onPressed: navigatetoSignIn, child: Text('Sign in')),
        RaisedButton(onPressed: navigatetoSignUp, child: Text('Sign up'))
      ],
    ));
  }

  void navigatetoSignIn() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Loginpage()));
  }

  void navigatetoSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SigNUP()));
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         Text('Nahi hua'),
//         RaisedButton(onPressed: () {
//           context.read<AuthenticationService>().signOut();
//         })
//       ]),
//     );
//   }
// }
