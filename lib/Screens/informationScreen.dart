import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid19_status/Components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid19_status/Animations/FadeAnimation.dart';

class InformationScreen extends StatelessWidget {
  void customLaunch(command) async{
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('could not launch $command');
    }
  }
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
                        FadeAnimation(1,Text('ASEEM BHUTRA',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SourceSansPro',
                          ),)),
                        Padding(padding: EdgeInsets.only(top: 10.0),),
                    FadeAnimation(1.2,Text('Flutter Developer/Enthusiast',
                          style: TextStyle(
                              fontSize: 20.0,
                            fontFamily: 'SourceSansPro',
                          ),)),
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
                            FadeAnimation(1.3,IconButton(
                              iconSize: kIconsize,
                              icon: FaIcon(FontAwesomeIcons.github),
                              onPressed: (){
                                customLaunch('https://github.com/AseemBhutra');
                              },
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            FadeAnimation(1.4,IconButton(
                              iconSize: kIconsize,
                              icon: FaIcon(FontAwesomeIcons.instagram),
                              onPressed: (){
                                customLaunch('http://www.instagram.com/aseemmaheshwari/');
                              },
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            FadeAnimation(1.5,IconButton(
                              icon: FaIcon(FontAwesomeIcons.facebook),
                              iconSize: kIconsize,
                              onPressed: (){
                                customLaunch('http://www.facebook.com/aseem.bhutra.7');
                              },
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            FadeAnimation(1.6,IconButton(
                              icon: FaIcon(FontAwesomeIcons.linkedin),
                              iconSize: kIconsize,
                              onPressed: (){
                                customLaunch('http://www.linkedin.com/in/aseem-bhutra-3b5329173');
                              },
                            )),
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
                child: FadeAnimation(1.3,Text('Credits :',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceSansPro',
                ),)),
              ),
            ),
            Padding(padding: EdgeInsets.only(top:5.0),),
            Container(
              margin: EdgeInsets.only(left: 30.0,right: 5.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FadeAnimation(1.4,Text('$bullet covid19india.org for India specific API.\n$bullet Fontawesomeicons for social media icons.\n$bullet Vipul Jha for Design.',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontFamily: 'SourceSansPro',
                  ),)),
              ),
            ),
            Expanded(
              child: Container(
                child:Align(
                  alignment: Alignment.bottomCenter,
                  child: FadeAnimation(1.3,Text(
                    'WE ARE ALL IN THIS TOGETHER, WITH ♥',
                    style: TextStyle(
                        fontSize: 15.0,
                      fontFamily: 'SourceSansPro',
                    ),
                  )),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 40.0),),
          ],

        ),

    );
  }
}



