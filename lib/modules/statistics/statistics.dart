import 'package:corona_tracker/helpers/auth.dart';
import 'package:corona_tracker/helpers/custom_switch.dart';
import 'package:corona_tracker/helpers/global_constants.dart';
import 'package:corona_tracker/models/country.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  List<Country> _countries;
  Country _myCountry;
  bool _enable = false;

    final _colorList = [
      Color(0xFF70e0fe),
      Colors.red,
      Color(0xFFff5849),
      Color(0xFFff968c),
    ];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return _countries == null
        ? Center(child: CircularProgressIndicator())
        : Container(
            // color: Theme.of(context).primaryColor,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RefreshIndicator(
                  onRefresh: _getData,
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
                        Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 60,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      'My Country',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    'Global',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.grey[400],
                              ),
                            ),
                            CustomSwitch(
                              value: _enable,
                              value1: 'My Country',
                              value2: 'Global',
                              onChanged: (bool val) {
                                setState(() {
                                  _enable = val;
                                });
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _enable ? _getWorldListView() : _getMyCountryView(),
                      ],
                    ),
                  ]),
                )));
  }

  _getMyCountryView() {
    Map<String, double> _dataMap = new Map();
    _dataMap.putIfAbsent("Recovered", () => _myCountry.recovered.toDouble());
    _dataMap.putIfAbsent("Death", () => _myCountry.deaths.toDouble());
    _dataMap.putIfAbsent("Active", () => _myCountry.active.toDouble());
    _dataMap.putIfAbsent("Total cases", () => _myCountry.cases.toDouble());

    return Column(
      children: <Widget>[
        Text(
          'Covid-19 cases in ${_myCountry.country}',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        PieChart(
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
        ),
        SizedBox(
          height: 10,
        ),
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
                "Recovered", _colorList.first, _myCountry.recovered),
            _getDataGridTile("Death", _colorList[1], _myCountry.deaths),
            _getDataGridTile("Active", _colorList[2], _myCountry.active),
            _getDataGridTile("Total cases", _colorList.last, _myCountry.cases)
          ],
        )
      ],
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

  _getWorldListView() {

    getInfoGrid(Color color, String text) {
      return Column(
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
                    text,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 4,)
        ],
      );
    }

    double _width = 100;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: _countries.length,
          itemBuilder: (context, index) {
            var _country = _countries[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: (MediaQuery.of(context).size.width - 40) / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Image.network(
                          _country.countryInfo.flag,
                          height: _width,
                          width: _width,
                        ),
                        Text('${_country.country}, ${_country.continent}'),
                      ], ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        getInfoGrid(_colorList.first, 'Recovered: ${_country.recovered}'),
                        getInfoGrid(_colorList[1], 'Death: ${_country.deaths}'),
                        getInfoGrid(_colorList[2], 'Active: ${_country.active}'),
                        getInfoGrid(_colorList.last, 'Cases: ${_country.cases}')
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future _getData() async {
    String url = "${GlobaolConstants.url}countries";
    final countries = await Auth.shared.request(url);
    setState(() {
      _countries = [];
      for (int i = 0; i < countries.length; i++) {
        Country country = Country.fromJson(countries[i]);
        if (country.country.toLowerCase() == 'nepal') {
          _myCountry = country;
        }
        _countries.add(country);
      }
    });
  }
}
