import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Stud_Details extends StatefulWidget {
  @override
  Stud_DetailsState createState() {
    return Stud_DetailsState();
  }
}

class Stud_DetailsState extends State<Stud_Details> {
  final _formkey = GlobalKey<FormState>();
  String _div;
  String _rollno;
  String _batch;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width / 25) * 24,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  child: Text(
                    'Enter Divison ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 250,
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Cannot be Empty';
                      }
                    },
                    onSaved: (input) => _div = input,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 25) * 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  child: Text(
                    'Enter Roll Number  ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 250,
                  child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Cannot be Empty';
                        }
                      },
                      onSaved: (input) => _rollno = input),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 25) * 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  child: Text(
                    'Enter Batch  ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 250,
                  child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Cannot be Empty';
                        }
                      },
                      onSaved: (input) => _batch = input),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 45,
            alignment: Alignment.center,
            margin: EdgeInsets.all(2),
            child: TextButton(
              child: Text(
                'Save',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(250, 122, 119, 185),
                alignment: Alignment.center,
                fixedSize: Size(150, 50),
                shadowColor: Colors.grey,
                elevation: 10,
              ),
              onPressed: submit,
            ),
          ),
        ],
      ),
    );
  }

  void submit() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      try {
        User user = FirebaseAuth.instance.currentUser;
        print(user.email);
        QuerySnapshot querys = await FirebaseFirestore.instance
            .collection('StudentDetails')
            .where('email', isEqualTo: user.email)
            .get();
        DocumentSnapshot document = querys.docs.first;
        final docid = document.id;
        await FirebaseFirestore.instance
            .collection('StudentDetails')
            .doc(docid)
            .update({'rollno': _rollno, 'div': _div, 'batch': _batch});

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  backgroundColor: Color.fromARGB(250, 122, 119, 185),
                  contentPadding: EdgeInsets.all(50),
                  content: Container(
                      height: 120,
                      width: 180,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Details Saved',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                              width: 70,
                              height: 40,
                              color: Colors.white,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    elevation: 10,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(250, 122, 119, 185),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )))
                        ],
                      )));
            });
      } catch (e) {
        print(e);
      }
    }
  }
}
