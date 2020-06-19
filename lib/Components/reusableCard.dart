import 'package:covid19_status/Components/constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.l1,this.l2,this.l3,this.color});


  final String l1;
  final String l2;
  final String l3;
  final Color color;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           Text(l1,
            style: TextStyle(
              color:color,
              fontSize: kHeadcontSize,
            ),
          ),
          SizedBox(
            height: kSizedboxheight,
          ),
          Text(
            l2,
            style: kTitleTextstyle,
          ),
          SizedBox(
            height: kSizedboxheight,
          ),
          Text(
            l3,
            style: TextStyle(
              fontSize: kTailContSize,
              color: color,
            ),
          ),
        ],
      ),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: kContainerColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
