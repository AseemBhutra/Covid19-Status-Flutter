import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text('About'),
      ),
        body: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: kContainerColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height:300,
                  child: Card(
                    elevation: 6.0,
                    color: kContainerColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('images/aseeem.jpeg'),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0),),
                        Text('ASEEM BHUTRA',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        Padding(padding: EdgeInsets.only(top: 10.0),),
                        Text('Flutter Developer/Enthusiast',
                          style: TextStyle(
                              fontSize: 20.0
                          ),),
                        Padding(padding: EdgeInsets.only(top: 10.0),),
                        Divider(
                          color: Colors.white,
                          indent: 40.0,
                          endIndent: 40.0,
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              iconSize: kIconsize,
                              icon: FaIcon(FontAwesomeIcons.whatsapp),
                              onPressed: (){},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              iconSize: kIconsize,
                              icon: FaIcon(FontAwesomeIcons.instagram),
                              onPressed: (){},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.facebook),
                              iconSize: kIconsize,
                              onPressed: (){},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.linkedin),
                              iconSize: kIconsize,
                              onPressed: (){},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
             ),
            Padding(padding: EdgeInsets.only(top:10.0),),
            Container(
              margin: EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Credits :',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            Padding(padding: EdgeInsets.only(top:5.0),),
            Container(
              margin: EdgeInsets.only(left: 30.0,right: 5.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('$bullet covid19india.org for India specific API.\n$bullet Fontawesomeicons for social media icons.\n$bullet Shutterstock for images and app icon.',
                  style: TextStyle(
                    fontSize: 19.0,
                  ),),
              ),
            ),
            Expanded(
              child: Container(
                child:Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'WE ARE ALL IN THIS TOGETHER, WITH ♥',
                    style: TextStyle(
                        fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 40.0),),
          ],

        ),

    );
  }
}



