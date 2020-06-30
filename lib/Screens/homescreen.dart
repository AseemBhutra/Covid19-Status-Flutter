import 'package:covid19_status/Animations/FadeAnimation.dart';
import 'package:covid19_status/Screens/history.dart';
import 'package:covid19_status/Screens/worlddata.dart';
import 'package:covid19_status/Components/constants.dart';
import 'package:covid19_status/Screens/informationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19_status/Components/reusableCard.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:covid19_status/Screens/State_Data.dart';
import 'package:covid19_status/Components/Networking.dart';
import 'package:intl/intl.dart';




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
  DateTime mdate ;
  String dateFormat;
  String timeFormat;
  List abc;
  var deltaconfirmed;
  var deltarecovered;
  var deltadeceased;

  Future getdata()async{
    var url = 'https://api.covid19india.org/data.json';
    Networkhelper networkhelper = Networkhelper(url);
    var countrydata = await networkhelper.getData();
    setState(() {
      data = countrydata;
    });
    mdate = DateFormat('dd/MM/yyyy HH:mm').parse(data['statewise'][0]['lastupdatedtime']);
    dateFormat = DateFormat("dd MMM yyyy").format(mdate);
    timeFormat = DateFormat("hh:mm a").format(mdate);
    deltaconfirmed = int.parse(data['statewise'][0]['deltaconfirmed']) <= 0 ? '♥' : data['statewise'][0]['deltaconfirmed'];
    deltarecovered = int.parse(data['statewise'][0]['deltarecovered']) <= 0 ? '♥' : data['statewise'][0]['deltarecovered'];
    deltadeceased = int.parse(data['statewise'][0]['deltadeaths']) <= 0 ? '♥' : data['statewise'][0]['deltadeaths'];
    
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Row(
          children: <Widget>[
            Text('Covid-19 Status'),
            Text(' (INDIA)',style: TextStyle(color: kSaffronColor),),
          ],
        ),
        actions: <Widget>[
         Tooltip(
            message: 'History',
            child: IconButton(
              icon: Icon(Icons.history,
                  color: Colors.white),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return History(history: data,);
                }));
              },
            ),
          ),
          Tooltip(
           message: 'info',
           child: IconButton(
            icon: Icon(Icons.info_outline,
            color: Colors.white),
             onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return InformationScreen();
              }));
             },
           ),
         ),
       ],
      ),
      backgroundColor: kBackgroundColor,
      body: data==null ?
        Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: getdata,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
        children: <Widget>[
        Expanded(
            flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: kContainerColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                child: PieChart(
                  dataMap: {
                    'Active': double.parse(data['statewise'][0]['active']),
                    'Recovered': double.parse(data['statewise'][0]['recovered']),
                    'Deceased':double.parse(data['statewise'][0]['deaths'])
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
                        l2: "${data['statewise'][0]['confirmed']}".replaceAllMapped(kreg, kmathFunc),
                        l3: '+ ' + deltaconfirmed.replaceAllMapped(kreg, kmathFunc),
                        color: kConfirmedcolor,
                      ),
                      ),
                    Expanded(
                      child: ReusableCard(
                        l1: 'Active',
                        l2: data['statewise'][0]['active'].replaceAllMapped(kreg, kmathFunc),
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
                          l2: data['statewise'][0]['recovered'].replaceAllMapped(kreg, kmathFunc),
                          l3: '+ ' + deltarecovered.replaceAllMapped(kreg, kmathFunc),
                          color: kRecoveredcolor,
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          l1: 'Deceased',
                          l2: data['statewise'][0]['deaths'].replaceAllMapped(kreg, kmathFunc),
                          l3: '+ ' + deltadeceased.replaceAllMapped(kreg, kmathFunc),
                          color: kDeceasedcolor,
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
                          l1: 'Samples Tested',
                          l2: data['tested'].last['totalsamplestested'].replaceAllMapped(kreg, kmathFunc),
                          l3: "+ ${data['tested'].last['samplereportedtoday']}".replaceAllMapped(kreg, kmathFunc),
                          color: kTestscolor,
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          l1: 'Last Updated',
                          l2: timeFormat,
                          l3: dateFormat,
                          color: kLastupdatedcolor,
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WorldData()));
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
                                'WORLD DATA ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff6dd3a6),
                                ),
                              )),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          //padding: EdgeInsets.all(0),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StateDataScreen(statedata: data,)));
                          },
                          child: Container(
                            height: 60,
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: kContainerColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: FadeAnimation(1.5,Text(
                                'STATE DATA',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffd11c42),
                                ),
                              )),
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
          ),
    );
  }
}