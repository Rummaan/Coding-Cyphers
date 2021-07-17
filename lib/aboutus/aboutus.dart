import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  List name = [
    'Rummaan Ahmad',
    'Raj Bagrecha',
    'Vishal Dedavat',
    'Yahya Sakerwala'
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          width: (MediaQuery.of(context).size.width / 2) - 250,
          height: (MediaQuery.of(context).size.height / 3) * 2,
          //color: Color.fromARGB(230, 235, 232, 231),
          child: Column(
            children: <Widget>[
              Container(
                width: (MediaQuery.of(context).size.width / 2) - 250,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  'Meet the Developers',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Righteous',
                    color: Color.fromARGB(230, 235, 232, 231),
                  ),
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width / 2) - 250,
                height: (MediaQuery.of(context).size.height / 3) * 1.5,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: (MediaQuery.of(context).size.height / 15) * 1.9,
                        child: ListTile(
                            leading: Icon(
                              Icons.account_circle_rounded,
                              color: Color.fromARGB(230, 235, 232, 231),
                              size:
                                  (MediaQuery.of(context).size.height / 19) * 2,
                            ),
                            title: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                              height:
                                  (MediaQuery.of(context).size.height / 19) * 2,
                              child: Text(
                                name[index],
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromARGB(230, 235, 232, 231),
                                    //fontWeight: FontWeight.bold,
                                    fontFamily: 'Righteous'),
                              ),
                            )));
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width / 2),
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0, 50, 50, 20),
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    'About Us',
                    style: TextStyle(
                        fontSize: 80,
                        color: Color.fromARGB(230, 235, 232, 231),
                        fontFamily: 'Righteous'),
                  )),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Text(
                  '''Coding Cyphers is Coding platform for the Students and by the Students. With the current pandemic ongoing the submissions and practicals, its always a tedious task for the students to properly document their code by going through a number of procedures. Coding Cyphers not only allows student to submit their documents by without any extra editing steps but also provides an online compiler consisting of various languages. 
              Also it helps the teacher to have a singe space for keeping recrds of all the practicals done by scheduling a proper practical format, so their work is minimised and things are pretty clear to Students as well''',
                  style: TextStyle(
                    color: Color.fromARGB(230, 235, 232, 231),
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
