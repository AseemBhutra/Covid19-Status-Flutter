import 'package:covid19_status/aboutthedisease.dart';
import 'package:covid19_status/constants.dart';
import 'package:covid19_status/informationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusableCard.dart';


class Homescreen extends StatefulWidget {
 Homescreen({this.totalData});
  final totalData;

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String confirmed;
  String active;
  String deceased;
  String lastUpdated;
  String recovered;
  String incConfirmed;
  String incDeceased;
  String incRecovered;
  var arr;


  @override
  void initState() {
    super.initState();
  fetchData(widget.totalData);
  }

  void fetchData(dynamic data){
    setState(() {
      if(data == null){
        confirmed = 'error';
        active = 'error';
        recovered = 'error';
        deceased = 'error';
        lastUpdated = 'error';
        incConfirmed = '0';
        incDeceased = '0';
        incRecovered = '0';
        arr = ['error','0'];
         return ;
      }
    confirmed = data['statewise'][0]['confirmed'];
     active = data['statewise'][0]['active'];
     recovered = data['statewise'][0]['recovered'];
     deceased = data['statewise'][0]['deaths'];
     lastUpdated = data['statewise'][0]['lastupdatedtime'];
    incConfirmed = data['statewise'][0]['deltaconfirmed'];
    incDeceased = data['statewise'][0]['deltadeaths'];
    incRecovered = data['statewise'][0]['deltarecovered'];
    arr = lastUpdated.split(' ');
    });
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text('Covid-19 Status'),
        actions: <Widget>[
         IconButton(
          icon: Icon(Icons.info_outline,
          color: Colors.white),
           onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return InformationScreen();
            }));
           },
         ),
       ],
      ),
      backgroundColor: kBackgroundColor,
      body: Column(
        children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: kContainerColor,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('images/cover1.jpg'),
                fit: BoxFit.fill,
              ),
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
                    Text('Confirmed',
                    style: TextStyle(
                      color:Colors.yellow,
                      fontSize: 20,
                    ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '$confirmed',
                      style: kTitleTextstyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '+ $incConfirmed',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.yellow,
                      ),
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
                      Text('Active',
                        style: TextStyle(
                          color:Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '$active',
                        style: kTitleTextstyle,
                      ),
                      SizedBox(
                        height: 10.0,
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
                        Text('Recovered',
                          style: TextStyle(
                            color:Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '$recovered',
                          style: kTitleTextstyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '+$incRecovered ',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.green,
                          ),
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
                        Text('Deceased',
                          style: TextStyle(
                            color:Colors.red,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '$deceased',
                          style: kTitleTextstyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '+$incDeceased',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.red,
                          ),
                        ),
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
                    child: Text('Last Updated',
                      style: TextStyle(
                        color:Colors.orange,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      '${arr[0]}',
                      style: kTitleTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      '${arr[1]}',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutTheDisease()));
              },
              child: Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: kContainerColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'ABOUT THE DISEASE',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

