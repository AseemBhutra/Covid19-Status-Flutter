import 'package:covid19_status/Components/constants.dart';
import 'package:flutter/material.dart';
import 'package:covid19_status/Components/reusableCard.dart';
import 'package:pie_chart/pie_chart.dart';
//import 'package:covid19_status/Screens/districtdata.dart';
import 'package:intl/intl.dart';

class StateScreen extends StatefulWidget {
  final data;
  final statecode;
  StateScreen({this.data, this.statecode});
  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
Map sdata;
String scode;


  @override
  void initState() {
    super.initState();
  getdata(widget.data,widget.statecode);
  }


  DateTime mdate;
  String dateFormat;
  String timeFormat;
  getdata(data,statecode){
    sdata = data;
    scode = statecode;
    //print(scode);
    formatTime();
    getIndex();
  }
int acode = 0;
  getIndex(){
    for(int i = 0; i<sdata['statewise'].length;i++){
     if(scode == sdata['statewise'][i]['statecode']){
       acode = i;
       print(acode);
       print(scode);
     }
    }
  }

  formatTime(){
    mdate = DateFormat('dd/MM/yyyy HH:mm').parse(sdata['statewise'][acode]['lastupdatedtime']);
    dateFormat = DateFormat("dd MMM yyyy").format(mdate);
    timeFormat = DateFormat("hh:mm a").format(mdate);
  }

  @override
  Widget build(BuildContext context) {
    //print(statedata);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(sdata['statewise'][acode]['state'].toString().toUpperCase(),),
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
                    'Active': double.parse(sdata['statewise'][acode]['active']),
                    'Recovered': double.parse(sdata['statewise'][acode]['recovered']),
                    'Deceased':double.parse(sdata['statewise'][acode]['deaths'])
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
                      l2: sdata['statewise'][acode]['confirmed'].replaceAllMapped(kreg, kmathFunc),
                      l3: '+ ${sdata['statewise'][acode]['deltaconfirmed']}'.replaceAllMapped(kreg, kmathFunc),
                      color: kConfirmedcolor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      l1: 'Active',
                      l2: sdata['statewise'][acode]['active'].replaceAllMapped(kreg, kmathFunc),
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
                      l2: sdata['statewise'][acode]['recovered'].replaceAllMapped(kreg, kmathFunc),
                      l3: '+ ${sdata['statewise'][acode]['deltarecovered']}'.replaceAllMapped(kreg, kmathFunc),
                      color: kRecoveredcolor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      l1: 'Deceased',
                      l2: sdata['statewise'][acode]['deaths'].replaceAllMapped(kreg, kmathFunc),
                      l3: '+ ${sdata['statewise'][acode]['deltadeaths']}'.replaceAllMapped(kreg, kmathFunc),
                      color: kDeceasedcolor,
                    ),
                  ),
                ],
              ),
            ),

    Container(
              height: 120,
              child: Row(
                children: <Widget>[
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
//
//            Container(
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    child: GestureDetector(
//                      //padding: EdgeInsets.all(0),
//                      onTap: (){
//                        Navigator.push(context, MaterialPageRoute(builder: (context) => DistrictData(name: sdata['statewise'][sindex]['state'],)));
//                      },
//                      child: Container(
//                        height: 60,
//                        margin: EdgeInsets.all(5.0),
//                        decoration: BoxDecoration(
//                          color: kContainerColor,
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
//                        child: Center(
//                          child: Text(
//                            'District data'+ ' of '+ sdata['statewise'][sindex]['state'].toString(),
//                            style: TextStyle(
//                              fontSize: kHeadcontSize,
//                              color: kTestscolor,
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
