import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';

class HorizonalList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HorizonalListState();
  }
}

class HorizonalListState extends State<HorizonalList> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      body: new Container(
        child: new ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            new Stack(
              children: [
                Image.asset(
                  "assets/images/Claritylogo.png",
                  width: 300,
                  height: 300,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '¿Qué es Clarity?',
                    style: TextStyle(
                      color: kThirdColor,
                      fontSize: 40,
                    ),
                  ),
                )
              ],
            ),
            new Container(
              width: screenSize.width,
              height: screenSize.height,
              color: kWhiteColor,
              child: new Center(
                child: new Text(
                  'hola',
                  style: new TextStyle(fontSize: 40.0, color: kSecondaryColor),
                ),
              ),
            ),
            new Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.pink,
              child: new Center(
                child: new Text(
                  'Page 4',
                  style: new TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
