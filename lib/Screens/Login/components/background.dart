import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 70,
            left: 140,
            child: Image.asset(
              "assets/images/Claritylogo.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            top: 60,
            left: 0,
            child: Image.asset(
              "assets/images/Flowers.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            top: 60,
            left: 279,
            child: Image.asset(
              "assets/images/Flowers.png",
              width: size.width * 0.3,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
