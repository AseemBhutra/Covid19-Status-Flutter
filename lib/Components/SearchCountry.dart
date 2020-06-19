import 'package:flutter/material.dart';
import 'package:covid19_status/Components/constants.dart';
import 'package:covid19_status/Screens/countryScreen.dart';

class SearchCountry extends SearchDelegate {

  final List countrydata;

  SearchCountry({this.countrydata});


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear),
        color: Colors.white,
        onPressed: () {
          query = '';
        },),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back),
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      },);
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
    final suggestionlist = query.isEmpty ? countrydata :
    countrydata.where((element) =>
        element['country'].toString().toLowerCase().contains(query)).toList();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView.builder(
          itemCount: suggestionlist.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    CountryScreen(data: suggestionlist,
                      index: index)));
              },
              child: Card(
                color: kBackgroundColor,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kContainerColor,
                  ),
                  height: 70,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 5,),
                      Center(
                        child: Text('${index + 1}.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              fontFamily: 'SourceSansPro'),
                        ),
                      ),
                      SizedBox(width: 5,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          suggestionlist[index]['countryInfo']['flag'],
                          height: 50,
                          width: 70,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        color: kContainerColor,
                        width: 175,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              suggestionlist[index]['country'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  fontFamily: 'SourceSansPro'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: kContainerColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                suggestionlist[index]['cases']
                                    .toString()
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
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }



  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionlist = query.isEmpty ? countrydata :
    countrydata.where((element) =>
        element['country'].toString().toLowerCase().contains(query)).toList();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView.builder(
          itemCount: suggestionlist.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    CountryScreen(data: suggestionlist,
                      index: index)));
              },
              child: Card(
                color: kBackgroundColor,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kContainerColor,
                  ),
                  height: 70,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 5,),
                      Center(
                        child: Text('${index + 1}.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              fontFamily: 'SourceSansPro'),
                        ),
                      ),
                      SizedBox(width: 5,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          suggestionlist[index]['countryInfo']['flag'],
                          height: 50,
                          width: 70,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        color: kContainerColor,
                        width: 175,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                             Text(
                              suggestionlist[index]['country'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  fontFamily: 'SourceSansPro'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: kContainerColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                               Text(
                                suggestionlist[index]['cases']
                                    .toString()
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
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}