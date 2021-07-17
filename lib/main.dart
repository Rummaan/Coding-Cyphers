import 'package:flutter/material.dart';
import 'package:the_bas/Homepage/landingpage.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: QPage(),
      //home: CNlist(),
      //home: LanguageMenu(),
      //home: Dashboard(),
      //home: Pracsmake(),
      //home: Classes(),
      //home: Trial(),
      home: HomeMain(),
    );
  }
}

// class AuthenticationWrapper extends StatelessWidget {
//   const AuthenticationWrapper({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();
//     if (firebaseUser != null) {
//       return Suggestion();
//     }
//     return HomeMain();
//   }
