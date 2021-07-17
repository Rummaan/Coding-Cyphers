import 'package:flutter/material.dart';

class Formfields extends StatefulWidget {
  @override
  FormfieldsState createState() {
    return FormfieldsState();
  }
}

class FormfieldsState extends State<Formfields> {
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width / 25) * 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: 100,
                  child: TextFormField(),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: 400,
                  child: TextFormField(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 25) * 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: 100,
                  child: TextFormField(),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: 400,
                  child: TextFormField(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 25) * 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: 100,
                  child: TextFormField(),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: 400,
                  child: TextFormField(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 25) * 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: 100,
                  child: TextFormField(),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: 400,
                  child: TextFormField(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 25) * 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: 100,
                  child: TextFormField(),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: 400,
                  child: TextFormField(),
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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
