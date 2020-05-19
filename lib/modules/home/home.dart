import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    'Covid-19',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Are you feeling sick?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'If you feel sick with any of covid-19 symptoms please call or sms us immediately',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            child: Text(
                              'Call now',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            child: Text(
                              'Send SMS',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30)
                ],
              ),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
            Expanded(
              child: Container(color: Colors.blue),
            )
          ]),
    );
  }
}
