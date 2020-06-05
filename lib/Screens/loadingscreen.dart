import 'dart:async';
import 'package:covid19_status/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19_status/Screens/homescreen.dart';
class Loadingscreen extends StatefulWidget {
  @override
  _LoadingscreenState createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {

  @override
  void initState() {
    super.initState();
    //getData();
    startTimer();
  }

  startTimer()async{
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }
  void route() async{
     Navigator.pushReplacement(context, MaterialPageRoute(
         builder: (context) => Homescreen()));
 }

   @override
   Widget build(BuildContext context) {

     return Scaffold(
       backgroundColor: kBackgroundColor,
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Container(
               child: Image.asset('images/abc.png'),
             ),
             //Padding(padding: EdgeInsets.only(top: 20.0)),
             Text(
               'Covid-19 Status',
               style: TextStyle(
                 fontSize: 20.0,
                 color: Colors.white,
               ),
             ),
             Padding(padding: EdgeInsets.only(top: 10.0),),
             Text(
               'v1.0',
               style: TextStyle(
                 fontSize: 15.0,
                 color: Colors.white,
               ),
             ),
             Padding(padding: EdgeInsets.only(top: 20.0),),
             CircularProgressIndicator(
               backgroundColor: Colors.white,
               strokeWidth: 3.0,
             ),
             Padding(padding: EdgeInsets.only(bottom: 20.0),),
           Expanded(
             child:Align(
               alignment: Alignment.bottomCenter,
               child: Text(
                 'Developed by Aseem Bhutra',
                 style: TextStyle(
                   fontSize: 15.0
                 ),
               ),
             ),
           ),
             Padding(padding: EdgeInsets.only(bottom: 40.0),),
           ],
         ),
       ),
     );
   }
 }