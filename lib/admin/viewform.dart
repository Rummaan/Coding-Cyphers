import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Viewform extends StatefulWidget {
  final String title;
  const Viewform(this.title);
  @override
  _ViewformState createState() => _ViewformState();
}

class _ViewformState extends State<Viewform> {
  send() async {
    var url = 'mailto:' + emailC.text;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
    // final Email email = Email(
    //   body: titleC.text +
    //       '\n' +
    //       descC.text +
    //       '\n' +
    //       inpcC.text +
    //       '\n' +
    //       expoutC.text +
    //       '\n' +
    //       remarkC.text,
    //   subject: 'Mail Regarding Suggestion Dropped at Coding Cyphers',
    //   recipients: [emailC.text],
    //   isHTML: isHTML,
    // );
    // String platformResponse;
    // try {
    //   await FlutterEmailSender.send(email);
    //   platformResponse = 'success';
    // } catch (e) {
    //   platformResponse = e.toString();
    // }
    // if (!mounted) return;
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text(platformResponse),
    // ));
  }

  final TextEditingController emailC = TextEditingController();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController titleC = TextEditingController();
  final TextEditingController descC = TextEditingController();
  final TextEditingController expoutC = TextEditingController();
  final TextEditingController inpcC = TextEditingController();
  final TextEditingController remarkC = TextEditingController();

  void details() async {
    QuerySnapshot querys = await FirebaseFirestore.instance
        .collection('Suggestions')
        .where('title', isEqualTo: widget.title)
        .get();
    DocumentSnapshot document = querys.docs.first;
    nameC.text = document['name'];
    emailC.text = document['email'];
    titleC.text = document['title'];
    descC.text = document['description'];
    inpcC.text = document['input'];
    expoutC.text = document['output'];
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width / 25) * 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: 400,
                  child: TextFormField(
                    controller: nameC,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  width: 600,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Email',
                    ),
                    controller: emailC,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 1000,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
              width: 100,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Problem Title',
                ),
                controller: titleC,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 1000,
            child: Container(
              width: 100,
              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Description of the Problem',
                ),
                maxLines: null,
                controller: descC,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 1000,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
              width: 100,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Input Constraints',
                ),
                maxLines: 3,
                controller: inpcC,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 1000,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Expected Output',
                ),
                maxLines: 5,
                controller: expoutC,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 1000,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
              child: TextFormField(
                controller: remarkC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Any Remarks to be given',
                ),
                maxLines: 5,
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 50,
            width: 150,
            alignment: Alignment.center,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Color.fromARGB(250, 122, 119, 185),
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
                  'Get Details',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                ),
                onPressed: details),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 50,
            width: 150,
            alignment: Alignment.center,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Color.fromARGB(250, 122, 119, 185),
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
                  'Send Email',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                ),
                onPressed: send),
          ),
        ],
      ),
    );
  }
}
