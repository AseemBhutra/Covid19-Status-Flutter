import 'package:covid19_status/Components/constants.dart';
import 'package:flutter/material.dart';
import 'package:covid19_status/Components/reusableCard.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:covid19_status/Animations/FadeAnimation.dart';

class StateScreen extends StatefulWidget {
  final index;
  final data;
  StateScreen({this.index,this.data});
  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
Map sdata;
int sindex;
  @override
  void initState() {
    super.initState();
  getdata(widget.index,widget.data);
  }

  getdata(index,data){
    sindex = index;
    sdata = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(sdata['statewise'][sindex]['state'].toString().toUpperCase(),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: kContainerColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: PieChart(
                  dataMap: {
                    'Confirmed': double.parse(sdata['statewise'][sindex]['confirmed']),
                    'Active': double.parse(sdata['statewise'][sindex]['active']),
                    'Recovered': double.parse(sdata['statewise'][sindex]['recovered']),
                    'Deceased':double.parse(sdata['statewise'][sindex]['deaths'])
                  },
                  colorList: [
                    Colors.yellow,
                    Colors.blue,
                    Colors.green,
                    Colors.red,
                  ],


                ),
              ),
            ),

            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(colour: kContainerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        FadeAnimation(1,Text('Confirmed',
                            style: TextStyle(
                              color:Colors.yellow,
                              fontSize: kHeadcontSize,
                            ),
                          )),
                          SizedBox(
                            height: kSizedboxheight,
                          ),
                      FadeAnimation(1.2,Text(
                            sdata['statewise'][sindex]['confirmed'],
                            style: kTitleTextstyle,
                        )),
                          SizedBox(
                            height: kSizedboxheight,
                          ),
                      FadeAnimation(1.3,Text(
                            '+ ${sdata['statewise'][sindex]['deltaconfirmed']}',
                            style: TextStyle(
                              fontSize: kTailContSize,
                              color: Colors.yellow,
                            ),
                      )),
                        ],
                      ),
                    ),

                  ),
                  Expanded(
                    child: ReusableCard(colour: kContainerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        FadeAnimation(1.4,Text('Active',
                            style: TextStyle(
                              color:Colors.blue,
                              fontSize: kHeadcontSize,
                            ),
                        )),
                          SizedBox(
                            height: kSizedboxheight,
                          ),
                      FadeAnimation(1.5,Text(
                            sdata['statewise'][sindex]['active'],
                            style: kTitleTextstyle,
                          )),
                          SizedBox(
                            height: kSizedboxheight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(colour: kContainerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        FadeAnimation(1.6,Text('Recovered',
                            style: TextStyle(
                              color:Colors.green,
                              fontSize: kHeadcontSize,
                            ),
                        )),
                          SizedBox(
                            height: kSizedboxheight,
                          ),
                      FadeAnimation(1.7,Text(
                            sdata['statewise'][sindex]['recovered'],
                            style: kTitleTextstyle,
                          )),
                          SizedBox(
                            height: kSizedboxheight,
                          ),
                      FadeAnimation(1.8,Text(
                            '+ ${sdata['statewise'][sindex]['deltarecovered']}',
                            style: TextStyle(
                              fontSize: kTailContSize,
                              color: Colors.green,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(colour: kContainerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        FadeAnimation(1.9,Text('Deceased',
                            style: TextStyle(
                              color:Colors.red,
                              fontSize: kHeadcontSize,
                            ),
                          )),
                          SizedBox(
                            height: kSizedboxheight,
                          ),
                      FadeAnimation(1.10,Text(
                            sdata['statewise'][sindex]['deaths'],
                            style: kTitleTextstyle,
                          )),
                          SizedBox(
                            height: kSizedboxheight,
                          ),
                      FadeAnimation(1.11,Text(
                            '+ ${sdata['statewise'][sindex]['deltadeaths']}',
                            style: TextStyle(
                              fontSize: kTailContSize,
                              color: Colors.red,
                            ),
                      )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(colour: kContainerColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: FadeAnimation(1.12,Text('Last Updated',
                        style: TextStyle(
                          color:Colors.orange,
                          fontSize: kHeadcontSize,
                        ),
                      )),
                    ),
                    SizedBox(
                      height: kSizedboxheight,
                    ),
                    Center(
                      child: FadeAnimation(1.13,Text(
                        sdata['statewise'][sindex]['lastupdatedtime'].toString().split(' ')[0],
                        style: kTitleTextstyle,
                      )),
                    ),
                    SizedBox(
                      height: kSizedboxheight,
                    ),
                    Center(
                      child: FadeAnimation(1.14,Text(
                        sdata['statewise'][sindex]['lastupdatedtime'].toString().split(' ')[1],
                        style: TextStyle(
                          fontSize: kTailContSize,
                          color: Colors.orange,
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
