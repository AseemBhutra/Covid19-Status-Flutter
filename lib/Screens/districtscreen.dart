import 'package:covid19_status/Components/DistrictModel.dart';
import 'package:flutter/material.dart';
import 'package:covid19_status/Components/constants.dart';
import 'package:covid19_status/Components/reusableCard.dart';
import 'package:pie_chart/pie_chart.dart';


class DistrictScreen extends StatefulWidget {
  final distdata;
  final dname;
  DistrictScreen({this.distdata,this.dname});

  @override
  _DistrictScreenState createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {

  List<CityData> listOfCityData = [];

  @override
  void initState() {
    super.initState();
  getdata(widget.distdata,widget.dname);
  }
int dindex;
  getdata(distdata,dname){
    listOfCityData = distdata;
    for(int a = 0;a< listOfCityData.length;a++){
      if(listOfCityData[a].district == dname){
      
        dindex = a;
        
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(listOfCityData[dindex].district.toUpperCase()),
        actions: <Widget>[
          Tooltip(message: 'Home',
          child: IconButton(
              icon: Icon(Icons.home,
                  color: Colors.white),
              onPressed: (){
                Navigator.popUntil(context, (route) => route.isFirst);
                },
            ),
          ),
        ],
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
                    'Active': double.parse(listOfCityData[dindex].active),
                    'Recovered': double.parse(listOfCityData[dindex].recovered),
                    'Deceased':double.parse(listOfCityData[dindex].deceased)
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
                      l2: listOfCityData[dindex].confirmed.replaceAllMapped(kreg, kmathFunc),
                      l3: ''.replaceAllMapped(kreg, kmathFunc),
                      color: kConfirmedcolor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      l1: 'Active',
                      l2: listOfCityData[dindex].active.replaceAllMapped(kreg, kmathFunc),
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
                      l2: listOfCityData[dindex].recovered.replaceAllMapped(kreg, kmathFunc),
                      l3: ''.replaceAllMapped(kreg, kmathFunc),
                      color: kRecoveredcolor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      l1: 'Deceased',
                      l2: listOfCityData[dindex].deceased.replaceAllMapped(kreg, kmathFunc),
                      l3: ''.replaceAllMapped(kreg, kmathFunc),
                      color: kDeceasedcolor,
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