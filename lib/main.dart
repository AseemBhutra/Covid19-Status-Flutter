import 'package:covid19_status/Screens/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'Screens/loadingscreen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
 Crashlytics.instance.enableInDevMode = true;
 FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runApp(MyApp());
}

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
