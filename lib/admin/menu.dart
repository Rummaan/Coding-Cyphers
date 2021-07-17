import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_bas/admin/suggestwindow.dart';
import 'package:the_bas/main.dart';

class Menuadmin extends StatefulWidget {
  @override
  _MenuadminState createState() => _MenuadminState();
}

class _MenuadminState extends State<Menuadmin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Tooltip(
          message: 'Back',
          padding: EdgeInsets.all(5),
          textStyle: TextStyle(fontSize: 20, color: Colors.white),
          child: IconButton(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            icon: Icon(Icons.arrow_left_rounded),
            iconSize: (MediaQuery.of(context).size.width / 26) - 10,
            disabledColor: Color.fromARGB(230, 235, 232, 231),
            color: Color.fromARGB(230, 235, 232, 231),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: CircleAvatar(
            radius: (MediaQuery.of(context).size.width / 26) / 2.5,
            backgroundColor: Color.fromARGB(230, 235, 232, 231),
            child: Text(
              'Ad',
              style: TextStyle(
                color: Color.fromARGB(250, 122, 119, 185),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Tooltip(
          message: 'Back to Suggestions',
          padding: EdgeInsets.all(5),
          textStyle: TextStyle(fontSize: 15, color: Colors.white),
          child: IconButton(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              icon: Icon(
                Icons.inbox_rounded,
              ),
              iconSize: (MediaQuery.of(context).size.width / 26) - 10,
              disabledColor: Color.fromARGB(230, 235, 232, 231),
              color: Color.fromARGB(230, 235, 232, 231),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SuggestWindow()));
              }),
        ),
        Spacer(),
        Tooltip(
          message: 'Sign Out',
          padding: EdgeInsets.all(5),
          textStyle: TextStyle(fontSize: 20, color: Colors.white),
          child: IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
            icon: Icon(
              Icons.power_settings_new_rounded,
            ),
            iconSize: (MediaQuery.of(context).size.width / 26) - 10,
            disabledColor: Color.fromARGB(230, 235, 232, 231),
            color: Color.fromARGB(230, 235, 232, 231),
            onPressed: signOut,
          ),
        ),
      ],
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }
}
