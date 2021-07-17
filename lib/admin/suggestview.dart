import 'package:flutter/material.dart';
import 'package:the_bas/admin/menu.dart';
import 'package:the_bas/admin/viewform.dart';

class Viewsuggest extends StatefulWidget {
  final String title;
  const Viewsuggest(this.title);
  @override
  _ViewsuggestState createState() => new _ViewsuggestState();
}

class _ViewsuggestState extends State<Viewsuggest> {
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
            child: Menuadmin(),
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
                          width: (MediaQuery.of(context).size.width / 25) * 23,
                          padding: EdgeInsets.all(50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Suggestion View',
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                child: Viewform(widget.title),
                              ),
                            ],
                          ),
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
