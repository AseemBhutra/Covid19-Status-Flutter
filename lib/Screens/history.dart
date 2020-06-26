import 'package:covid19_status/Components/SearchDate.dart';
import 'package:flutter/material.dart';
import 'package:covid19_status/Animations/FadeAnimation.dart';
import 'package:covid19_status/Components/constants.dart';

class History extends StatefulWidget {
  History({this.history});
  final history;
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  List<String> cases = [];
  @override
  void initState() {
    getdata(widget.history);
    super.initState();
  }
Map data;
  getdata(history){
    data = history;
    for(int i=data['cases_time_series'].length-1; i >= 0 ;i--) {
      cases.add(data['cases_time_series'][i]['date'].toString()
      +'  '+data['cases_time_series'][i]['totalconfirmed'].toString() 
      + '  ('+data['cases_time_series'][i]['dailyconfirmed'].toString() +')');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: kBackgroundColor,
       actions: <Widget>[
         Tooltip(
           message: 'Search',
           child: IconButton(
             icon: Icon(Icons.search,
                 color: Colors.white),
             onPressed: (){
             showSearch(context: context, delegate: Search(dateSearch: cases));
             },
           ),
         ),
       ],
      ),
      body: data == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          return Card(
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
                    SizedBox(width: 5,),
                    Text ('${index + 1} .',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          fontFamily: 'SourceSansPro'),
                    ),
                    SizedBox(width: 5,),
                  Expanded(
                    child: Container(
                      color: kContainerColor,
                      //width: 175,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FadeAnimation(1,Text(
                            cases[index].toString().split('  ')[0],
                             style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                fontFamily: 'SourceSansPro',
                                color: Colors.deepOrange,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: kContainerColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              FadeAnimation(1.2,Text(
                                cases[index].toString().split('  ')[1].replaceAllMapped(kreg, kmathFunc),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    fontFamily: 'SourceSansPro',
                                    color: Colors.white),
                              )),
                              FadeAnimation(1.2,Text(
                               ' ' +cases[index].toString().split('  ')[2].replaceAllMapped(kreg, kmathFunc),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    fontFamily: 'SourceSansPro',
                                    color: Colors.redAccent),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: data == null ? 0 : data['cases_time_series'].length,
      ),
    );
  }
}

