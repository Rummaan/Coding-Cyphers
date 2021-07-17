import 'package:flutter/material.dart';
import 'package:the_bas/dashboard/fields.dart';

class Teacher_Details extends StatefulWidget {
  @override
  Teacher_DetailsState createState() {
    return Teacher_DetailsState();
  }
}

class Teacher_DetailsState extends State<Teacher_Details> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width / 25) * 24,
            alignment: Alignment.center,
            child: Text(
              'Enter Division and Subject Name ',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 25) * 24,
            alignment: Alignment.center,
            child: Text(
              '(For ex- 4   Python Programming)',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Formfields(),
        ],
      ),
    );
  }
}
