import 'package:flutter/material.dart';

class AnimatedButterflyWidget extends StatefulWidget {
  @override
  _AnimatedButterflyWidgetState createState() =>
      _AnimatedButterflyWidgetState();
}

class _AnimatedButterflyWidgetState extends State<AnimatedButterflyWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animationFloatUp;
  Animation<double> _animationGrowSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _butterflyHeight = MediaQuery.of(context).size.height / 2;
    double _butterflyWidth = MediaQuery.of(context).size.height / 3;
    double _butterflyBottomLocation =
        MediaQuery.of(context).size.height - _butterflyHeight;

    _animationFloatUp = Tween(begin: _butterflyBottomLocation, end: 0.0)
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn)));

    _animationGrowSize = Tween(begin: 50.0, end: _butterflyWidth).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.5, curve: Curves.elasticOut)));

    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(
            top: _animationFloatUp.value,
          ),
          width: _animationGrowSize.value,
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Image.asset(
          'assets/images/ic.png',
          height: _butterflyHeight,
          width: _butterflyWidth,
        ),
      ),
    );
  }
}
