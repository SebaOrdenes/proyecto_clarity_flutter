import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Perfil/perfil_screen.dart';
import 'package:flutter_auth/constants.dart';

class AppBarComponent extends StatefulWidget {
  final bool centerTitle;
  final String titleText;
  final Color backgroundColor;
  final Color textColor;
  final String fontFamily;
  final Color iconColor;
  const AppBarComponent({
    Key key,
    this.centerTitle = true,
    this.titleText,
    this.backgroundColor = kDeepOrangeColor,
    this.iconColor = Colors.black,
    this.fontFamily = 'Raleway',
    this.textColor = Colors.black,
  }) : super(key: key);
  @override
  _AppBarComponentState createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {
  bool centerTitle;
  String titleText;
  Color backgroundColor;
  Color textColor;
  String fontFamily;
  Color iconColor;

  @override
  void initState() {
    super.initState();
    centerTitle = widget.centerTitle;
    titleText = widget.titleText;
    backgroundColor = widget.backgroundColor;
    textColor = widget.textColor;
    fontFamily = widget.fontFamily;
    iconColor = widget.iconColor;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: this.centerTitle,
        title: Text(
          titleText,
          style: TextStyle(color: this.textColor, fontFamily: this.fontFamily),
        ),
        backgroundColor: this.backgroundColor,
        iconTheme: IconThemeData(
          color: this.iconColor,
        ),
        actions: [
          IconButton(
            splashColor: kPinkOscuro, //No muestra circulo tras presionar botón
            icon: Icon(
              Icons.account_circle,
              color: kPinkOscuro,
              size: 33.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PerfilScreen();
                  },
                ),
              );
            },
          ),
        ]);
  }
}
