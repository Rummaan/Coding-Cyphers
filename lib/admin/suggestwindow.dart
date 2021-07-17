import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_bas/admin/menu.dart';
import 'package:the_bas/admin/suggestview.dart';

class SuggestWindow extends StatefulWidget {
  @override
  _SuggestWindowState createState() => _SuggestWindowState();
}

class _SuggestWindowState extends State<SuggestWindow> {
  void remove(String title) async {
    QuerySnapshot querys = await FirebaseFirestore.instance
        .collection('Suggestions')
        .where('title', isEqualTo: title)
        .get();
    querys.docs.first.reference.delete();
  }

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
                          .collection('Suggestions')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text(
                              'No Suggestions to be Viewed',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          );
                        }
                        return ListView(
                          children: snapshot.data.docs.map((document) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                  'Suggestion: ' + document['title'],
                                  style: TextStyle(fontSize: 30),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                minVerticalPadding: 20,
                                subtitle: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text('Description: ' +
                                      document['description']),
                                ),
                                tileColor: Colors.white,
                                contentPadding: EdgeInsets.all(20),
                                trailing: Container(
                                  width:
                                      (MediaQuery.of(context).size.width / 4),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        IconButton(
                                            icon: Icon(Icons
                                                .edit_location_alt_rounded),
                                            iconSize: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    26) -
                                                10,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Viewsuggest(document[
                                                              'title'])));
                                            }),
                                        IconButton(
                                            icon: Icon(Icons
                                                .remove_circle_outline_outlined),
                                            iconSize: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    26) -
                                                10,
                                            onPressed: () =>
                                                remove(document['title']))
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
}
