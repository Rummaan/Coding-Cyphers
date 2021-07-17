import 'package:flutter/material.dart';
import 'package:the_bas/loginsignup/form_teacher.dart';

class Sign_Upteach extends StatelessWidget {
  const Sign_Upteach({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 235, 232, 231),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Text(
              'CODING CYPHERS',
              style: TextStyle(
                fontFamily: 'Righteous',
                fontSize: 70,
                //fontWeight: FontWeight.bold,
                color: Color.fromARGB(250, 122, 119, 185),
              ),
            ),
          ),
          Container(
            height: 450,
            width: 1100,
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
                color: Color.fromARGB(250, 122, 119, 185),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  )
                ]),
            child: Row(
              children: <Widget>[
                Container(
                  width: 450,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                        child: Text(
                          'Student Sign Up',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(230, 235, 232, 231),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(230, 235, 232, 231),
                          radius: 130,
                          child: Text(
                            'Tc',
                            style:
                                TextStyle(fontSize: 100, color: Colors.black),
                          ), //Text
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 550,
                  child: TeacherDetails(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
