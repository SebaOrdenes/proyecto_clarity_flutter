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
      height: size.height,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 200,
            left: 50,
            child: Image.asset(
              "assets/images/Medicion.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            top: 200,
            left: 249,
            child: Image.asset(
              "assets/images/Informacion.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            top: 400,
            left: 249,
            child: Image.asset(
              "assets/images/Revitalizar.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            top: 400,
            left: 50,
            child: Image.asset(
              "assets/images/Tratamiento.png",
              width: size.width * 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
