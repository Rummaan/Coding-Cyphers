import 'package:flutter/material.dart';
import 'package:the_bas/language/languages_sub.dart';
import 'package:the_bas/side_bar/menubar.dart';

class LanguageMenu extends StatelessWidget {
  const LanguageMenu({Key key}) : super(key: key);

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
            child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color.fromARGB(250, 122, 119, 185),
                          content: Stack(
                            children: <Widget>[
                              Menupop(),
                            ],
                          ),
                        );
                      });
                }),
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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
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
                    child: Lang_avail(),
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
