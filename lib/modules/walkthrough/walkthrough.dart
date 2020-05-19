import 'package:corona_tracker/helpers/global_constants.dart';
import 'package:corona_tracker/models/walkthrough_model.dart';
import 'package:corona_tracker/modules/main/main_page.dart';
import 'package:flutter/material.dart';

class WalkthroughPage extends StatefulWidget {
  @override
  _WalkthroughPageState createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<WalkthroughPage> {
  int _currentIndex = 0;
  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Column(
                children: <Widget>[
                  Text(
                    GlobaolConstants.walkthroughTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: GlobaolConstants.walkthroughs.length,
                itemBuilder: (context, index) {
                  return WalkthroughWidget(
                      model: GlobaolConstants.walkthroughs[index]);
                },
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            )
          ],
        ),
      ),
      bottomSheet: _currentIndex != GlobaolConstants.walkthroughs.length - 1
          ? Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 30 + MediaQuery.of(context).padding.bottom,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'SKIP',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      _navigateToMainPage(context);
                    },
                  ),
                  Row(children: _createPageIndicator()),
                  GestureDetector(
                    child: Text(
                      'NEXT',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      setState(() {
                        _currentIndex += 1;
                        _pageController.animateToPage(_currentIndex,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      });
                    },
                  )
                ],
              ),
            )
          : GestureDetector(
              child: Container(
                height: 30 + MediaQuery.of(context).padding.bottom,
                alignment: Alignment.center,
                color: Colors.green,
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
              onTap: () {
                _navigateToMainPage(context);
              },
            ),
    );
  }

  List<Widget> _createPageIndicator() {
    double _width = 10;
    List<Widget> widgets = [];
    for (int i = 0; i < GlobaolConstants.walkthroughs.length; i++) {
      bool _selected = i == _currentIndex;
      var widget = Container(
        width: _selected ? _width * 2 : _width,
        height: _width,
        decoration: BoxDecoration(
            color: _selected ? Colors.green : Colors.redAccent,
            borderRadius: BorderRadius.circular(_width / 2)),
      );
      var box = SizedBox(width: _width / 2);
      widgets.add(widget);
      widgets.add(box);
    }
    return widgets;
  }

  _navigateToMainPage(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
  }
}

class WalkthroughWidget extends StatelessWidget {
  final WalkthroughModel model;

  const WalkthroughWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            model.imagePath,
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                Text(
                  model.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(model.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
