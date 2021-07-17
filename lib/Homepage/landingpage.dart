import 'package:flutter/material.dart';
import 'package:the_bas/aboutus/aboutus.dart';
import 'package:the_bas/loginsignup/logintemplate.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final datakey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 235, 232, 231),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(
            minHeight: (MediaQuery.of(context).size.height),
            maxHeight: double.infinity,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(230, 235, 232, 231),
                Color.fromARGB(250, 122, 119, 185),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 6,
                alignment: Alignment.center,
                //color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    // Container(
                    //   //alignment: Alignment.bottomLeft,
                    //   padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    //   width: MediaQuery.of(context).size.width / 2,
                    //   child: Text('CC',
                    //       style: TextStyle(
                    //           fontSize: 30,
                    //           color: Color.fromARGB(250, 122, 119, 185),
                    //           fontFamily: 'Righteous')),
                    // ),
                    // Spacer(),
                    Container(
                        height: 50,
                        width: 120,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(
                                250,
                                122,
                                119,
                                185,
                              ),
                              elevation: 10,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Logintemp()),
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(230, 235, 232, 231),
                                fontWeight: FontWeight.w600,
                              ),
                            ))),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                        height: 50,
                        width: 120,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(
                                250,
                                122,
                                119,
                                185,
                              ),
                              elevation: 10,
                            ),
                            onPressed: () {
                              Scrollable.ensureVisible(datakey.currentContext);
                            },
                            child: Text(
                              'About us',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(230, 235, 232, 231),
                                fontWeight: FontWeight.w600,
                              ),
                            ))),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: (MediaQuery.of(context).size.width * 1.25) / 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width * 1) / 3,
                              child: Text(
                                'CODING CYPHERS',
                                style: TextStyle(
                                    fontSize: 100,
                                    color: Color.fromARGB(250, 122, 119, 185),
                                    fontFamily: 'Righteous'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width * 1) / 3,
                              child: Text(
                                'A Platform for the Students and Colleges',
                                style: TextStyle(
                                  color: Color.fromARGB(250, 122, 119, 185),
                                  fontSize: 25,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width * 1.70) / 3,
                      child: Image.asset('assets/images/mp1.png'),
                    ),
                  ],
                ),
              ),
              Container(
                key: datakey,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(100),
                child: Aboutus(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
