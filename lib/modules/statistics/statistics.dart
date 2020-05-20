import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Theme.of(context).primaryColor,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(children: <Widget>[
                  SizedBox(height: 30),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Statistics',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  SizedBox(height: 20),
                  _getChartData()
                  // TabBar(tabs: [
                  //   Tab(icon: Container(color: Colors.blue)),
                  //   Tab(icon: Container(color: Colors.red))
                  // ]),
                  // TabBarView(
                  //   children: <Widget>[
                  //     Expanded(child: Text("This is call Tab View")),
                  //     Expanded(child: Text("This is chat Tab View"))
                  //   ],
                  // )
                ],
              ),
            ])));
  }

  _getChartData() {
    return Column(
      children: <Widget>[
        Text(
          'Covid-19 Global Cases',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        GridView.count(crossAxisCount: 2,
        childAspectRatio: 1.5,
          padding: EdgeInsets.all(8),
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            _getDataGridTile(),
            _getDataGridTile(),
            _getDataGridTile(),
            _getDataGridTile()
          ],
        )
      ],
    );
  }

  _getDataGridTile() {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(color: Colors.red,
              width: 20,
              height: 20,),
              SizedBox(width: 5),
              Text('data',style: TextStyle(color: Colors.grey[500],
              fontSize: 12),),
            ],
          ),
          SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('data',style: TextStyle(
              fontSize: 16),
            textAlign: TextAlign.left,),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey[300]
        )
      ),
      );
  }

}
