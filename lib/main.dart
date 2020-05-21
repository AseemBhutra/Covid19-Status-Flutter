import 'package:covid19_status/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'loadingscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Loadingscreen(),
    );
  }
}






//https://api.covid19india.org/data.json