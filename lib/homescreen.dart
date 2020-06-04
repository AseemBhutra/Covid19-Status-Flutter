import 'package:covid19_status/aboutthedisease.dart';
import 'package:covid19_status/constants.dart';
import 'package:covid19_status/informationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusableCard.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:covid19_status/State_Data.dart';
import 'package:covid19_status/Networking.dart';

class Homescreen extends StatefulWidget {


  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  void initState() {
    super.initState();
    getdata();
  }
  Map data;
  void getdata()async{
    var url = 'https://api.covid19india.org/data.json';
    Networkhelper networkhelper = Networkhelper(url);
    var countrydata = await networkhelper.getData();
    setState(() {
      data = countrydata;
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
      body: data==null ?
        Center(child: CircularProgressIndicator())
          : Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
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
                'Confirmed': double.parse(data['statewise'][0]['confirmed']),
                'Active': double.parse(data['statewise'][0]['active']),
                'Recovered': double.parse(data['statewise'][0]['recovered']),
                'Deceased':double.parse(data['statewise'][0]['deaths'])
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
                        data['statewise'][0]['confirmed'],
                        style: kTitleTextstyle,
                      ),
                      SizedBox(
                        height: kSizedboxheight,
                      ),
                      Text(
                        '+ ${data['statewise'][0]['deltaconfirmed']}',
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
                          data['statewise'][0]['active'],
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
                            data['statewise'][0]['recovered'],
                            style: kTitleTextstyle,
                          ),
                          SizedBox(
                            height: kSizedboxheight,
                          ),
                          Text(
                            '+ ${data['statewise'][0]['deltarecovered']}',
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
                            data['statewise'][0]['deaths'],
                            style: kTitleTextstyle,
                          ),
                          SizedBox(
                            height: kSizedboxheight,
                          ),
                          Text(
                            '+ ${data['statewise'][0]['deltadeaths']}',
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
                        data['statewise'][0]['lastupdatedtime'].toString().split(' ')[0],
                        style: kTitleTextstyle,
                      ),
                    ),
                    SizedBox(
                      height: kSizedboxheight,
                    ),
                    Center(
                      child: Text(
                        data['statewise'][0]['lastupdatedtime'].toString().split(' ')[1],
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StateDataScreen(statedata: data)));
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
          ),
    );
  }
}


