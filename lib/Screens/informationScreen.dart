import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid19_status/Components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid19_status/Animations/FadeAnimation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:covid19_status/Components/Networking.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  Map data;

  Future getUpdate() async {
    var url = 'https://lucid-lalande-b1a47e.netlify.app/.netlify/functions/api';
    Networkhelper networkhelper = Networkhelper(url);
    var update = await networkhelper.getData();
    setState(() {
      data = update;
    });
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Covid19 Status v$kVersion',
              style: TextStyle(
                color: kBackgroundColor,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    kChanges,
                    style: TextStyle(
                      color: kContainerColor,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: kSaffronColor,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> _showupdate() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Covid19 Status v${data['version']}',
              style: TextStyle(
                color: kBackgroundColor,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    data['changes'],
                    style: TextStyle(
                      color: kContainerColor,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Not now!!',
                  style: TextStyle(
                    color: kSaffronColor,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(
                  'Update',
                  style: TextStyle(
                    color: kSaffronColor,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  customLaunch(data['url']);
                },
              ),
            ],
          );
        });
  }

  noUpdateAvailable() {
    Fluttertoast.showToast(
        msg: 'No update available!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1);
  }

  void customLaunch(command) async {
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: kContainerColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: MediaQuery.of(context).size.height / 2,
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
                        Padding(
                          padding: EdgeInsets.only(top: 7.0),
                        ),
                        FadeAnimation(
                            1,
                            Text(
                              'ASEEM BHUTRA',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SourceSansPro',
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 7.0),
                        ),
                        FadeAnimation(
                            1.2,
                            Text(
                              'Flutter Developer/Enthusiast',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey,
                                fontFamily: 'SourceSansPro',
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 7.0),
                        ),
                        Divider(
                          color: Colors.white,
                          indent: 40.0,
                          endIndent: 40.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 7.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FadeAnimation(
                                1.3,
                                IconButton(
                                  iconSize: kIconsize,
                                  icon: FaIcon(FontAwesomeIcons.github),
                                  onPressed: () {
                                    customLaunch(
                                        'https://github.com/AseemBhutra');
                                  },
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            // FadeAnimation(1.4,IconButton(
                            //   iconSize: kIconsize,
                            //   icon: FaIcon(FontAwesomeIcons.instagram),
                            //   onPressed: (){
                            //     customLaunch('http://www.instagram.com/aseemmaheshwari/');
                            //   },
                            // )),
                            FadeAnimation(
                                1.4,
                                IconButton(
                                  iconSize: kIconsize,
                                  icon: FaIcon(FontAwesomeIcons.globe),
                                  onPressed: () {
                                    customLaunch(
                                        'https://aseembhutra.github.io/CovidWeb/');
                                  },
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            FadeAnimation(
                                1.5,
                                IconButton(
                                  icon: FaIcon(FontAwesomeIcons.facebook),
                                  iconSize: kIconsize,
                                  onPressed: () {
                                    customLaunch(
                                        'http://www.facebook.com/aseem.bhutra.7');
                                  },
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            FadeAnimation(
                                1.6,
                                IconButton(
                                  icon: FaIcon(FontAwesomeIcons.linkedin),
                                  iconSize: kIconsize,
                                  onPressed: () {
                                    customLaunch(
                                        'http://www.linkedin.com/in/aseem-bhutra-3b5329173');
                                  },
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 7.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: 130,
                                height: 42,
                                child: Center(
                                  child: FadeAnimation(
                                    1.2,
                                    Text(
                                      'CHECK UPDATE',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'SourceSansPro',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                await getUpdate();
                                if (data['version'] == kVersion) {
                                  noUpdateAvailable();
                                } else {
                                  _showupdate();
                                }
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: 130,
                                height: 42,
                                child: Center(
                                  child: FadeAnimation(
                                    1.2,
                                    Text(
                                      'CHANGE LOG',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'SourceSansPro',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                _showDialog();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Container(
              margin: EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FadeAnimation(
                    1.3,
                    Text(
                      'Credits :',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SourceSansPro',
                      ),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 5.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FadeAnimation(
                    1.4,
                    Text(
                      '$bullet covid19india.org for India specific API.'
                      '\n$bullet corona.lmao.ninja for Global API.'
                      '\n$bullet Rohit Tambi for Testing/Web.'
                      '\n$bullet SuryaKant for Web'
                      '\n$bullet Abdul Hakeem Quazi for app icon.'
                      '\n$bullet Vipul Jha for Design.',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontFamily: 'SourceSansPro',
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
