import 'package:covid19_status/Components/DistrictModel.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:covid19_status/Screens/districtscreen.dart';

class SearchDistrict extends SearchDelegate {
  final List<CityData> listofCityData;
  SearchDistrict({this.listofCityData});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        color: Colors.white,
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: kBackgroundColor,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionlist = query.isEmpty
        ? listofCityData
        : listofCityData
            .where((element) =>
                element.district.toString().toLowerCase().contains(query))
            .toList();
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView.builder(
          itemCount: suggestionlist.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DistrictScreen(
                              distdata: suggestionlist,
                              dname: suggestionlist[index].district,
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
                      Text(
                        '${index + 1} .',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'SourceSansPro'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 170,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              suggestionlist[index].district,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  fontFamily: 'SourceSansPro'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              suggestionlist[index]
                                  .confirmed
                                  .replaceAllMapped(kreg, kmathFunc),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  fontFamily: 'SourceSansPro',
                                  color: Colors.deepOrange),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionlist = query.isEmpty
        ? listofCityData
        : listofCityData
            .where((element) =>
                element.district.toString().toLowerCase().contains(query))
            .toList();
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView.builder(
          itemCount: suggestionlist.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DistrictScreen(
                              distdata: suggestionlist,
                              dname: suggestionlist[index].district,
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
                      Text(
                        '${index + 1} .',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'SourceSansPro'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 170,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              suggestionlist[index].district,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  fontFamily: 'SourceSansPro'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              suggestionlist[index]
                                  .confirmed
                                  .replaceAllMapped(kreg, kmathFunc),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  fontFamily: 'SourceSansPro',
                                  color: Colors.deepOrange),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
