import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_bas/pagechange/mainpage.dart';
import 'package:the_bas/side_bar/iconmenu.dart';

class CNlist extends StatefulWidget {
  @override
  _CNlistState createState() => _CNlistState();
}

class _CNlistState extends State<CNlist> {
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
            //height: MediaQuery.of(context).size.height / 1.4,
            constraints: BoxConstraints(
              maxHeight: double.infinity,
            ),
            color: Color.fromARGB(230, 235, 232, 231),
            padding: EdgeInsets.all(10),
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
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Problems')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData ||
                            snapshot.data.docs.length == 0) {
                          return Center(
                            child: Text(
                              'Loading..',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          );
                        }
                        return ListView(
                          children: snapshot.data.docs.map((document) {
                            return Card(
                              child: ListTile(
                                title: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: Text(
                                    document['title'],
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ),
                                subtitle: SizedBox(
                                  height: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                minVerticalPadding: 20,
                                tileColor: Colors.white,
                                contentPadding: EdgeInsets.all(20),
                                trailing: Container(
                                  width:
                                      (MediaQuery.of(context).size.width / 4),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        IconButton(
                                            icon: Icon(
                                              Icons.remove_red_eye_rounded,
                                            ),
                                            iconSize: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    25) -
                                                10,
                                            onPressed: () {
                                              nextpagecheck(document);
                                            }),
                                      ]),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void nextpagecheck(DocumentSnapshot document) async {
    try {
      User user = FirebaseAuth.instance.currentUser;
      QuerySnapshot querys = await FirebaseFirestore.instance
          .collection('Problems')
          .doc(document.id)
          .collection('record')
          .where('email', isEqualTo: user.email)
          .get();

      DocumentSnapshot documents = querys.docs.first;
      if (documents.exists) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(250, 122, 119, 185),
                contentPadding: EdgeInsets.all(50),
                content: Container(
                    width: 400,
                    height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'You have Already Solved this Problem',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                            width: 300,
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  height: 50,
                                  width: 120,
                                  child: TextButton(
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              250, 122, 119, 185)),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )),
              );
            });
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QPage(document)));
      }
    } catch (e) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => QPage(document)));
    }
  }
}
