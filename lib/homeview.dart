import 'package:flutter/material.dart';
import 'package:the_bas/pagechange/pattern1/Pages.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);
  final List<CollapsibleItem> collapsibleitems = [
    CollapsibleItem(text: 'try1', icon: Icons.ac_unit, onPressed: () {}),
    CollapsibleItem(text: 'try1', icon: Icons.ac_unit, onPressed: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 235, 232, 231),
      body: Container(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 90,
              child: IconButton(
                icon: Icon(Icons.menu_rounded),
                onPressed: () {
                  // CollapsibleSidebar(
                  //   items: collapsibleitems,
                  //   title: 'Lorem Ipsum',
                  //   textStyle: TextStyle(
                  //       fontSize: 10), //custom style for sidebar title
                  //   titleStyle: TextStyle(
                  //       fontSize: 10), //custom style for collapsible items text
                  //   toggleTitleStyle: TextStyle(
                  //       fontSize: 10), //custom style for toggle button title
                  //   avatarImg: NetworkImage(
                  //       'https://www.w3schools.com/howto/img_avatar.png'),
                  //   body: null,
                  //   height: double.infinity,
                  //   minWidth: 30,
                  //   maxWidth: 100,
                  //   borderRadius: 15,
                  //   iconSize: 40,
                  //   toggleTitle: 'Collapse', //title text of Toggle Button
                  //   toggleButtonIcon: Icons.chevron_right,
                  //   backgroundColor: Color(0xff2B3138),
                  //   selectedIconBox: Color(0xff2F4047),
                  //   selectedIconColor: Color(0xff4AC6EA),
                  //   selectedTextColor: Color(0xffF3F7F7),
                  //   unselectedIconColor: Color(0xff6A7886),
                  //   unselectedTextColor: Color(0xffC0C7D0),
                  //   duration: Duration(milliseconds: 500),
                  //   curve: Curves.fastLinearToSlowEaseIn,
                  //   screenPadding: 4,
                  //   topPadding: 0, //space between image avatar and icons
                  //   bottomPadding: 0, //space between icons and toggle button
                  //   fitItemsToBottom:
                  //       true, //fit all icons to the end of the space between image avatar and toggle button
                  //   showToggleButton: true,
                  // );
                },
                iconSize: 40,
                color: Color.fromARGB(250, 122, 119, 185),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'CODING CYPHERS',
                      style: TextStyle(
                        fontFamily: 'Righteous',
                        fontSize: 65,
                        //fontWeight: FontWeight.bold,
                        color: Color.fromARGB(250, 122, 119, 185),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                const PageChange(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
