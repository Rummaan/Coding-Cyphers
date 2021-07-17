import 'package:flutter/material.dart';

class Lang_avail extends StatelessWidget {
  const Lang_avail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/javalogo.png'),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstIn),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.5,
                  ),
                  //color: Colors.blue,
                ),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 200,
                height: 200,
                child: Text(
                  'JAVA',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Righteous',
                  ),
                ),
              ),
              onTap: () {},
            ),
            SizedBox(
              width: 40,
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/pythonlogo.png'),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstIn),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.5,
                  ),
                ),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 200,
                height: 200,
                child: Text(
                  'PYTHON',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Righteous',
                  ),
                ),
              ),
              onTap: () {},
            ),
            SizedBox(
              width: 40,
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/clogo.png'),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstIn),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.5,
                  ),
                  //color: Colors.blue,
                ),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 200,
                height: 200,
                child: Text(
                  'C',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Righteous',
                  ),
                ),
              ),
              onTap: () {},
            ),
            SizedBox(
              width: 40,
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/c2logo.png'),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstIn),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.5,
                  ),
                  //color: Colors.blue,
                ),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 200,
                height: 200,
                child: Text(
                  'C++',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Righteous',
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
