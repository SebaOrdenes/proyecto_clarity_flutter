import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Layout/components/background.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  final List<dynamic> testResult;
  Body(this.testResult, {Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List testResults = [];
  String reply = "";
  String description = "";
  String route = "";

  //initState se ejecuta antes que se carguen todos los componentes
  @override
  void initState() {
    super.initState();
    print("Soy un resultado: ${widget.testResult}");
    testResults = widget.testResult;
    setText(testResults);
  }

  setText(List testResults) {
    this.reply = testResults[0]["reply"];
    this.description = testResults[0]["description"];
    this.route = testResults[0]["route"];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 1),
              //padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fondo.jpeg'),
                    fit: BoxFit.cover),
              ),
              child: Text(
                "$reply",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'Raleway',
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 1),
              //padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fondo.jpeg'),
                    fit: BoxFit.cover),
              ),
              child: Text(
                "$description",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'Raleway',
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 1),
              //padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fondo.jpeg'),
                    fit: BoxFit.cover),
              ),
              child: Text(
                "$route",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'Raleway',
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
    /* Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$reply"),
          Text("$description"),
          Text("$route"),
        ],
      ),
    );
  }
}
}
*/