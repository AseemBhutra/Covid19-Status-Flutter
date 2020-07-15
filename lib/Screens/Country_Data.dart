import 'package:covid19_status/Animations/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19_status/Components/constants.dart';
import 'package:covid19_status/Components/Networking.dart';
import 'package:covid19_status/Screens/countryScreen.dart';
import 'package:covid19_status/Components/SearchCountry.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CountryDataScreen extends StatefulWidget {
  @override
  _CountryDataScreenState createState() => _CountryDataScreenState();
}

class _CountryDataScreenState extends State<CountryDataScreen> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  List data;
  Future getdata() async {
    var url = 'https://corona.lmao.ninja/v2/countries?sort=cases';
    Networkhelper networkhelper = Networkhelper(url);
    var countrydata = await networkhelper.getData();
    setState(() {
      data = countrydata;
    });
  }

  dataRefreshed() {
    Fluttertoast.showToast(
        msg: 'Data Refreshed!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1);
  }

  Future onRefresh() async {
    await getdata();
    dataRefreshed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('World Data'),
        backgroundColor: kBackgroundColor,
        actions: <Widget>[
          Tooltip(
            message: 'Search',
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: SearchCountry(countrydata: data));
              },
            ),
          ),
        ],
      ),
      body: data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              backgroundColor: kBackgroundColor,
              color: Colors.white,
              onRefresh: onRefresh,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryScreen(
                                    data: data,
                                    index: index,
                                  )));
                    },
                    child: Card(
                      color: kBackgroundColor,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kContainerColor,
                        ),
                        height: kListContainerHeight,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 5,
                            ),
                            Center(
                              child: Text(
                                '${index + 1}.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    fontFamily: 'SourceSansPro'),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                data[index]['countryInfo']['flag'],
                                height: 45,
                                width: 70,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                color: kContainerColor,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FadeAnimation(
                                        1,
                                        Text(
                                          data[index]['country'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              fontFamily: 'SourceSansPro'),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: kContainerColor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    FadeAnimation(
                                        1.2,
                                        Text(
                                          data[index]['cases']
                                              .toString()
                                              .replaceAllMapped(
                                                  kreg, kmathFunc),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              fontFamily: 'SourceSansPro',
                                              color: Colors.deepOrange),
                                        )),
                                    SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: data == null ? 0 : data.length,
              ),
            ),
    );
  }
}
