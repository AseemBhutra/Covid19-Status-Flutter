import 'package:covid19_status/Animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:covid19_status/Components/Networking.dart';
import 'package:covid19_status/Components/reusableCard.dart';
import 'package:covid19_status/Components/constants.dart';
import 'package:covid19_status/Screens/aboutthedisease.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:covid19_status/Screens/Country_Data.dart';

class WorldData extends StatefulWidget {
  @override
  _WorldDataState createState() => _WorldDataState();
}

class _WorldDataState extends State<WorldData> {

  @override
  void initState() {
    super.initState();
    getdata();
  }
  Map worldData;
  Future getdata()async{
    var url = 'https://corona.lmao.ninja/v2/all';
    Networkhelper networkhelper = Networkhelper(url);
    var worlddata = await networkhelper.getData();
    setState(() {
      worldData = worlddata;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Row(
          children: <Widget>[
            Text('Covid-19 Status'),
            Text('  (WORLD)',style: TextStyle(color: Color(0xff6dd3a6)),),
          ],
        ),
        actions: <Widget>[
          Tooltip(
            message: 'About Disease',
            child: IconButton(
              icon: Icon(Icons.info,
                  color: Colors.white),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AboutTheDisease();
                }));
              },
            ),
          ),
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: worldData==null ?
      Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: kContainerColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: PieChart(
                    dataMap: {
                      'Active': double.parse(worldData['active'].toString()),
                      'Recovered': double.parse(worldData['recovered'].toString()),
                      'Deceased':double.parse(worldData['deaths'].toString())
                    },
                    colorList: [
                      kPiechartactivecolor,
                      kPiechartrecoveredcolor,
                      kPiechartdeathcolor,
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        l1: 'Confirmed',
                        l2: worldData['cases'].toString().replaceAllMapped(kreg, kmathFunc),
                        l3: '+ ${worldData['todayCases']}'.toString().replaceAllMapped(kreg, kmathFunc),
                        color: kConfirmedcolor,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        l1: 'Active',
                        l2: worldData['active'].toString().replaceAllMapped(kreg, kmathFunc),
                        l3: '',
                        color: kActivecolor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        l1: 'Recovered',
                        l2: worldData['recovered'].toString().replaceAllMapped(kreg, kmathFunc),
                        l3: '+ ${worldData['todayRecovered']}'.toString().replaceAllMapped(kreg, kmathFunc),
                        color: kRecoveredcolor,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        l1: 'Deceased',
                        l2: worldData['deaths'].toString().replaceAllMapped(kreg, kmathFunc),
                        l3: '+ ${worldData['todayDeaths']}'.toString().replaceAllMapped(kreg, kmathFunc),
                        color: kDeceasedcolor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height:115,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        l1: 'Total Tests',
                        l2: worldData['tests'].toString().replaceAllMapped(kreg, kmathFunc),
                        l3: '',
                        color: kTestscolor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        //padding: EdgeInsets.all(0),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CountryDataScreen()));
                        },
                        child: Container(
                          height: 60,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: kContainerColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: FadeAnimation(1.4,Text(
                              'COUNTRY DATA',
                              style: TextStyle(
                                fontSize: kHeadcontSize,
                                color: kLastupdatedcolor,
                              ),
                            ),),
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
      ),
    );
  }
}
