import 'package:flutter/material.dart';
import 'package:the_bas/dashboard/dbstudform.dart';
import 'package:the_bas/dashboard/dbteacherform.dart';
import 'package:the_bas/side_bar/iconmenu.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 235, 232, 231),
      body: Row(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 26,
            color: Color.fromARGB(250, 122, 119, 185),
            child: Menu(),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 25) * 24,
            color: Color.fromARGB(230, 235, 232, 231),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Text(
                      'CODING CYPHERS',
                      style: TextStyle(
                        fontFamily: 'Righteous',
                        fontSize: 75,
                        color: Color.fromARGB(250, 122, 119, 185),
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            title + ' Dashboard',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          //child: Stud_Details(),
                          child: title == 'Student'
                              ? Stud_Details()
                              : Teacher_Details(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
