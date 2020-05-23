import 'package:corona_tracker/models/country.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CountryStatistics extends StatelessWidget {
  final Country country;

  final _colorList = [
      Color(0xFF70e0fe),
      Colors.red,
      Color(0xFFff5849),
      Color(0xFFff968c),
    ];

 CountryStatistics({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${country.country} Statistics'),
      ), body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
        _getPieChart(context),
        SizedBox(height: 20),
        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          padding: EdgeInsets.all(8),
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            _getDataGridTile(
                "Recovered", _colorList.first, country.recovered),
            _getDataGridTile("Death", _colorList[1], country.deaths),
            _getDataGridTile("Active", _colorList[2], country.active),
            _getDataGridTile("Total cases", _colorList.last, country.cases)
          ],
        )
      ]
      ),
      
    );
  }

  _getPieChart(BuildContext context) {
    Map<String, double> _dataMap = new Map();
    _dataMap.putIfAbsent("Recovered", () => country.recovered.toDouble());
    _dataMap.putIfAbsent("Death", () => country.deaths.toDouble());
    _dataMap.putIfAbsent("Active", () => country.active.toDouble());
    _dataMap.putIfAbsent("Total cases", () => country.cases.toDouble());

    return PieChart(
          dataMap: _dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: 32.0,
          chartRadius: MediaQuery.of(context).size.width / 2,
          showChartValuesInPercentage: true,
          showChartValues: true,
          showChartValuesOutside: false,
          chartValueBackgroundColor: Colors.transparent,
          colorList: _colorList,
          showLegends: true,
          legendPosition: LegendPosition.right,
          decimalPlaces: 1,
          showChartValueLabel: true,
          initialAngle: 0,
          chartValueStyle: defaultChartValueStyle.copyWith(
            color: Colors.white,
          ),
          chartType: ChartType.disc,
        );
  }

  _getDataGridTile(String title, Color color, int count) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                color: color,
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '$count',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey[300])),
    );
  }

}