import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String value1;
  final String value2;

  CustomSwitch({Key key, this.value, this.onChanged, this.value1, this.value2})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState(value1, value2);
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  final String _value1;
  final String _value2;

  _CustomSwitchState(this._value1, this._value2);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
            onTap: () {
              if (_animationController.isCompleted) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
              widget.value == false
                  ? widget.onChanged(true)
                  : widget.onChanged(false);
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 50,
              child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 4, left: 4),
              child: Container(
                alignment: widget.value
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 60) / 2,
                  height: 44,
                  child: Text(
                      _circleAnimation.value == Alignment.centerLeft
                          ? _value1
                          : _value2,
                      style: TextStyle(color: Colors.white)),
                  decoration: BoxDecoration( 
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(22)),
                ),
              ),
                ),
                color: Colors.transparent,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(25.0),
              //   color: Colors.grey[400],
              // ),
            ));
      },
    );
  }
}
