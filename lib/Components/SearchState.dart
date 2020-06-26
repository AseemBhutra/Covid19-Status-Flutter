import 'package:flutter/material.dart';
import 'package:covid19_status/Components/constants.dart';
import 'package:covid19_status/Animations/FadeAnimation.dart';
import 'package:covid19_status/Screens/Statescreen.dart';

class SearchState extends SearchDelegate{

  final Map statedata;
  final List searchState;
  SearchState({this.statedata,this.searchState});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: kBackgroundColor,
    );
  }

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
  Widget buildResults(BuildContext context) {
  return Container();
  }

  @override
   Widget buildSuggestions(BuildContext context) {
   final suggestionlist = query.isEmpty ? searchState :
   searchState.where((element) => element.toString().split('  ')[0].toLowerCase().contains(query)).toList();
   print(suggestionlist);
  return Scaffold(
    backgroundColor: kBackgroundColor,
    body: ListView.builder(
      itemCount: suggestionlist == null ? 0 : suggestionlist.length,
      itemBuilder: ( context, index){
      return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>StateScreen(data: statedata, statecode: suggestionlist[index].toString().split('  ')[2])));
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
                  children: <Widget>[
//                    SizedBox(width: 5,),
//                    Text ('${index + 1} .',
//                      style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontSize: 18.0,
//                          fontFamily: 'SourceSansPro'),
//                    ),
//                    SizedBox(width: 5,),
                    Container(
                      color: kContainerColor,
                      width: 175,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FadeAnimation(1,Text(
                            suggestionlist[index].toString().split('  ')[0],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                            fontFamily: 'SourceSansPro'),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      color: kContainerColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 30,),
                      FadeAnimation(1.2,Text(
                            suggestionlist[index].toString().split('  ')[1].replaceAllMapped(kreg, kmathFunc),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                fontFamily: 'SourceSansPro',
                            color: Colors.deepOrange),
                      )),
                        ],
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