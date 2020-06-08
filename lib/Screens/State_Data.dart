import 'package:covid19_status/Animations/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19_status/Components/constants.dart';
import 'package:covid19_status/Screens/Statescreen.dart';
class StateDataScreen extends StatefulWidget {
  StateDataScreen({this.statedata});
  final  statedata;

  @override
  _StateDataScreenState createState() => _StateDataScreenState();
}

class _StateDataScreenState extends State<StateDataScreen> {
  Map data;

  @override
  void initState() {
    super.initState();
    getdata(widget.statedata);
  }
  getdata(statedata){
    data = statedata;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('State Data'),
        backgroundColor: kBackgroundColor,
      ),
      body: data == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>StateScreen(data: data,index: index)));
            },
            child: Card(
              color: kBackgroundColor,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kContainerColor,
                ),
                height: 70,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: <Widget>[
                    Container(
                      color: kContainerColor,
                      width: 175,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FadeAnimation(1,Text(
                            data['statewise'][index]['state'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                            fontFamily: 'SourceSansPro'),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      color: kContainerColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 30,),
                      FadeAnimation(1.2,Text(
                            data['statewise'][index]['confirmed'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                fontFamily: 'SourceSansPro',
                            color: Colors.deepOrange),
                      )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: data == null ? 0 : data['statewise'].length,
      ),
    );
  }
}
