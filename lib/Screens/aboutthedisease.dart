import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19_status/Components/datasource.dart';
import 'package:covid19_status/Components/constants.dart';
import 'package:covid19_status/Animations/FadeAnimation.dart';

class AboutTheDisease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text('About The Disease'),
          backgroundColor: kBackgroundColor,
        ),

        body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: FadeAnimation(1,Text(
              DataSource.questionAnswers[index]['question'],
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontFamily: 'SourceSansPro',
                  fontSize: 18.0),
            )),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                    DataSource.questionAnswers[index]['answer'],
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 18.0),),
              )
            ],
          );
        }),
    );
  }
}