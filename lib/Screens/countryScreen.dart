import 'package:flutter/material.dart';
import 'package:covid19_status/Components/constants.dart';
import 'package:covid19_status/Components/reusableCard.dart';
import 'package:pie_chart/pie_chart.dart';

class CountryScreen extends StatefulWidget {
  final data;
  final index;
  CountryScreen({this.data,this.index});

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  List cdata;
  int cindex;

  @override
  void initState() {
    super.initState();
    getdata(widget.data,widget.index);
  }

  getdata(data,index){
    cdata = data;
    cindex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(cdata[cindex]['country'].toString().toUpperCase(),),
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
                    'Active': double.parse(cdata[cindex]['active'].toString()),
                    'Recovered': double.parse(cdata[cindex]['recovered'].toString()),
                    'Deceased':double.parse(cdata[cindex]['deaths'].toString())
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
                      l2: cdata[cindex]['cases'].toString().replaceAllMapped(kreg, kmathFunc),
                      l3: '+ ${cdata[cindex]['todayCases']}'.toString().replaceAllMapped(kreg, kmathFunc),
                      color: kConfirmedcolor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      l1: 'Active',
                      l2: cdata[cindex]['active'].toString().replaceAllMapped(kreg, kmathFunc),
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
                      l2: cdata[cindex]['recovered'].toString().replaceAllMapped(kreg, kmathFunc),
                      l3: '+ ${cdata[cindex]['todayRecovered']}'.toString().replaceAllMapped(kreg, kmathFunc),
                      color: kRecoveredcolor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      l1: 'Deceased',
                      l2: cdata[cindex]['deaths'].toString().replaceAllMapped(kreg, kmathFunc),
                      l3: '+ ' + cdata[cindex]['deltadeaths'].toString().replaceAllMapped(kreg, kmathFunc),
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
                      l1: 'Total Tests',
                      l2: cdata[cindex]['tests'].toString().replaceAllMapped(kreg, kmathFunc),
                      l3: '',
                      color: kTestscolor,
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
