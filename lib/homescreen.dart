import 'package:covid19_status/aboutthedisease.dart';
import 'package:covid19_status/constants.dart';
import 'package:covid19_status/informationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusableCard.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:covid19_status/State_Data.dart';


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
  List<String> stateName = [];
  List<String> stateconfirmed = [];
  List<String> stateactive = [];
  List<String> statedeath = [];
  List<String> staterecovered = [];


  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata(){
    fetchData(widget.totalData);
    getStateData(widget.totalData);
  }



 void  getStateData(dynamic data){
    for (int i = 0;i < 38; i++){
  var name = data['statewise'][i]['state'];
  stateName.add(name);
  stateconfirmed.add(data['statewise'][i]['confirmed']);
  stateactive.add(data['statewise'][i]['active']);
  statedeath.add(data['statewise'][i]['deaths']);
    staterecovered.add(data['statewise'][i]['recovered']);
    }
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
            ),
          child: PieChart(
            dataMap: {
              'Confirmed': double.parse(confirmed),
              'Active': double.parse(active),
              'Recovered': double.parse(recovered),
              'Deceased':double.parse(deceased)
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
                    Text('Confirmed',
                    style: TextStyle(
                      color:Colors.yellow,
                      fontSize: kHeadcontSize,
                    ),
                    ),
                    SizedBox(
                      height: kSizedboxheight,
                    ),
                    Text(
                      '$confirmed',
                      style: kTitleTextstyle,
                    ),
                    SizedBox(
                      height: kSizedboxheight,
                    ),
                    Text(
                      '+ $incConfirmed',
                      style: TextStyle(
                        fontSize: kTailContSize,
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
                          fontSize: kHeadcontSize,
                        ),
                      ),
                      SizedBox(
                        height: kSizedboxheight,
                      ),
                      Text(
                        '$active',
                        style: kTitleTextstyle,
                      ),
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
                        Text('Recovered',
                          style: TextStyle(
                            color:Colors.green,
                            fontSize: kHeadcontSize,
                          ),
                        ),
                        SizedBox(
                          height: kSizedboxheight,
                        ),
                        Text(
                          '$recovered',
                          style: kTitleTextstyle,
                        ),
                        SizedBox(
                          height: kSizedboxheight,
                        ),
                        Text(
                          '+$incRecovered ',
                          style: TextStyle(
                              fontSize: kTailContSize,
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
                            fontSize: kHeadcontSize,
                          ),
                        ),
                        SizedBox(
                          height: kSizedboxheight,
                        ),
                        Text(
                          '$deceased',
                          style: kTitleTextstyle,
                        ),
                        SizedBox(
                          height: kSizedboxheight,
                        ),
                        Text(
                          '+$incDeceased',
                          style: TextStyle(
                              fontSize: kTailContSize,
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
                        fontSize: kHeadcontSize,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: kSizedboxheight,
                  ),
                  Center(
                    child: Text(
                      '${arr[0]}',
                      style: kTitleTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: kSizedboxheight,
                  ),
                  Center(
                    child: Text(
                      '${arr[1]}',
                      style: TextStyle(
                        fontSize: kTailContSize,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    //padding: EdgeInsets.all(0),
                    onTap: (){
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
                              'ABOUT THE \n   DISEASE',
                              style: TextStyle(
                                fontSize: kHeadcontSize,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    //padding: EdgeInsets.all(0),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StateDataScreen(statename: stateName,stateactive: stateactive,stateconfirmed: stateconfirmed,statedeaths: statedeath,staterecovered: staterecovered)));
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
                              'STATE DATA',
                              style: TextStyle(
                                fontSize: kHeadcontSize,
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
          ),
        ],
      ),
    );
  }
}


//Charts ki jagah ye tha (First container me)
//image: DecorationImage(
//image: AssetImage('images/cover1.jpg'),
//fit: BoxFit.fill,
//),