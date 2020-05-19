import 'dart:async';

import 'package:corona_tracker/helpers/global_constants.dart';
import 'package:corona_tracker/modules/walkthrough/walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/main/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Corona Tracker",
        debugShowCheckedModeBanner: false,
        home: WalkthroughPage());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 200), () {
      _getEntryPoint();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _getEntryPoint() async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    bool isAlreadyOpened =
        prefs.getBool(GlobaolConstants.isAlreadyOpened) ?? false;
    if (isAlreadyOpened) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      await prefs.setBool(GlobaolConstants.isAlreadyOpened, true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => WalkthroughPage()));
    }
  }
}
