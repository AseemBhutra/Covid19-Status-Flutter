import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class AboutTheDisease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('About The Disease'),
      backgroundColor: kBackgroundColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250.0,
          child: Card(
            child: Image.asset('images/cover2.png',
            fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10.0),
          ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0),),
          Text('COVID-19',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),),
          Padding(padding: EdgeInsets.only(top: 10.0),),
          Container(
            padding: EdgeInsets.only(left:15.0,right: 15.0),
            child: Text('Coronavirus disease 2019 (COVID-19) is an infectious disease caused by severe acute respiratory syndrome coronavirus . It was first identified in December 2019 in Wuhan, China, and has since spread globally, resulting in an ongoing pandemic.',
            style: TextStyle(
              fontSize: 22.0,
            ),
            ),
          ),
        ],
      ),
    );
  }
}
