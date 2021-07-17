import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_bas/side_bar/iconmenu.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: (MediaQuery.of(context).size.width / 25) * 24,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(40),
                        child: Text(
                          'Leaderboard',
                          style:
                              TextStyle(fontSize: 40, fontFamily: 'Righteous'),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width / 25) * 24,
                          padding: EdgeInsets.all(20),
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Results')
                                .orderBy('points', descending: true)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData ||
                                  snapshot.data.docs.length == 0) {
                                return Center(
                                  child: Text(
                                    'Loading..',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                );
                              }
                              return ListView(
                                children: snapshot.data.docs.map((document) {
                                  return Card(
                                    child: ListTile(
                                        focusColor:
                                            Color.fromARGB(230, 235, 232, 231),
                                        title: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 10, 0, 0),
                                          child: Text(
                                            document['name'],
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        minVerticalPadding: 20,
                                        tileColor:
                                            Color.fromARGB(230, 235, 232, 231),
                                        contentPadding: EdgeInsets.all(20),
                                        trailing: Container(
                                            width: 200,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  document['points'] + ' P',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          250, 122, 119, 185),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 50),
                                                ),
                                                // Icon(
                                                //   Icons.b,
                                                //   size: 50,
                                                //   color: Color.fromARGB(
                                                //       250, 122, 119, 185),
                                                // )
                                              ],
                                            ))

                                        // CircleAvatar(
                                        //   radius: 150,
                                        //   backgroundColor:
                                        //       Color.fromARGB(250, 122, 119, 185),
                                        //   child: Text(
                                        //     document['points'],
                                        //     style: TextStyle(
                                        //         color: Color.fromARGB(
                                        //             230, 235, 232, 231),
                                        //         fontWeight: FontWeight.bold,
                                        //         fontSize: 20),
                                        //   ),
                                        // ),
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
                )
                    // child: Container(
                    //   padding: EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   alignment: Alignment.center,
                    //
                    // ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
