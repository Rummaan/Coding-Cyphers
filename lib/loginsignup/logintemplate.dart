import 'package:flutter/material.dart';
import 'package:the_bas/loginsignup/loginpage.dart';
import 'package:the_bas/loginsignup/signup_Stud.dart';
import 'package:the_bas/loginsignup/signup_Teacher.dart';
import 'package:the_bas/loginsignup/signupteach.dart';

class Logintemp extends StatelessWidget {
  const Logintemp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4,
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Text(
              'CODING CYPHERS',
              style: TextStyle(
                fontFamily: 'Righteous',
                fontSize: 70,
                color: Color.fromARGB(250, 122, 119, 185),
              ),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height / 4) * 2.6,
            width: MediaQuery.of(context).size.width / 1.25,
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
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: (MediaQuery.of(context).size.width) / 2.75,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 40,
                            color: Color.fromARGB(230, 235, 232, 231),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: LoginPage(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Container(
                  width: (MediaQuery.of(context).size.width) / 2.8,
                  height: (MediaQuery.of(context).size.width / 4) * 1.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(30),
                        child: Text(
                          'Don\'t have an Account? Sign up now!',
                          style: TextStyle(
                              color: Color.fromARGB(230, 235, 232, 231),
                              fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 400,
                        height: 50,
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
                            'Student',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(250, 122, 119, 185),
                                fontWeight: FontWeight.w600),
                          ),
                          style: TextButton.styleFrom(
                            alignment: Alignment.center,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sign_Up()),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        width: 400,
                        height: 50,
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
                            'Teacher',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(250, 122, 119, 185),
                                fontWeight: FontWeight.w600),
                          ),
                          style: TextButton.styleFrom(
                            alignment: Alignment.center,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sign_Upteach()),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
