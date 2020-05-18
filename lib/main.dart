import 'package:corona_tracker/modules/walkthrough/walkthrough.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Corona Tracker",
      debugShowCheckedModeBanner: false,
      home: WalkthroughPage()
    );
  }
}