import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class StateDataScreen extends StatefulWidget {
  StateDataScreen({this.stateactive,this.stateconfirmed,this.statename,this.statedeaths,this.staterecovered});
  final statename;
  final stateconfirmed;
  final stateactive;
  final statedeaths;
  final staterecovered;

  @override
  _StateDataScreenState createState() => _StateDataScreenState();
}

class _StateDataScreenState extends State<StateDataScreen> {
  List<String> name = [];
  List<String> confirmed = [];
  List<String> active = [];
  List<String> deaths = [];
  List<String> recovered = [];
  @override
  void initState() {
    super.initState();
  printstateName(widget.statename,widget.stateconfirmed,widget.stateactive,widget.statedeaths,widget.staterecovered);
  }
  void printstateName(dynamic sname,dynamic sconfirmed,dynamic sactive,dynamic sdeaths,dynamic srecovered){
     name = sname;
     confirmed = sconfirmed;
     active = sactive;
     deaths = sdeaths;
     recovered = srecovered;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){
            },)
        ],
        title: Text('State Data'),
        backgroundColor: kBackgroundColor,
      ),
      body: name == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: kBackgroundColor,
            child: Container(
              color: kContainerColor,
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    color: kContainerColor,
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          name[index],
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'CONFIRMED:' +
                                  confirmed[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow),
                            ),
                            Text(
                              'ACTIVE:' +
                                  active[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),

                            Text(
                              'DEATHS:' +
                                  deaths[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                            ),
                            ),
                            Text(
                              'RECOVERED:' +
                                  recovered[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
        itemCount: name == null ? 0 : name.length,
      ),
    );
  }
}
