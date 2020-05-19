import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getHeaderView(),
            SizedBox(height: 30),
            _getPreventionView(),
            SizedBox(height: 30),
            _getFooterView(),
            SizedBox(height: 30),
            // Expanded(
            //   child: Container(),
            // )
          ]),
    );
  }

  Widget _getHeaderView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Covid-19',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Are you feeling sick?',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 15),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Call now',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Send SMS',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
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
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
    );
  }

  Widget _getPreventionView() {
    double _cellHeight = (MediaQuery.of(context).size.width - 30) / 3;
    var preventionList = [
      {'image': 'images/wash_hands.png', 'msg': 'Avoid close contact'},
      {'image': 'images/wash_hands.png', 'msg': 'Clean your hands often'},
      {'image': 'images/wash_hands.png', 'msg': 'Wear a face mask'},
    ].toList();
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Prevention',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Container(
          height: _cellHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: _cellHeight,
                child: Column(children: <Widget>[
                  Image.asset(
                    preventionList[index]['image'],
                    width: _cellHeight - 42,
                    height: _cellHeight - 42,
                  ),
                  SizedBox(height: 8),
                  Text(
                    preventionList[index]['msg'],
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
              );
            },
            itemCount: preventionList.length,
          ))
    ]);
  }

  Widget _getFooterView() {
    final double _footerHeight = 100.0;
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: _footerHeight,
            width: double.infinity,
            padding: EdgeInsets.all(12.0),
            child: Padding(
              padding: EdgeInsets.only(left: _footerHeight),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Do your own test!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Follow the instructions to do your own test',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, 
                    fontSize: 12,
                    wordSpacing: 1.5),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: _footerHeight + 10,
            height: _footerHeight + 10,
            child: Image.asset('images/nurse.png'))
      ],
    );
  }
}
