import 'dart:async';
import 'package:covid19_status/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19_status/Screens/homescreen.dart';

class Loadingscreen extends StatefulWidget {
  @override
  _LoadingscreenState createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  @override
  void initState() {
    super.initState();
    //getData();

    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 2);

    return Timer(duration, route);
  }

  void route() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Homescreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      child: Image.asset(
                        'images/ab1.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Covid-19 Status',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text(
                    kVersion.toString(),
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'DEVELOPED WITH ♥ IN INDIA',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'by Aseem Bhutra',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
