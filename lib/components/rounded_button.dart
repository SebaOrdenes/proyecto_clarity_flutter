import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final double dimension;
  final bool loading; //permite mostrar circulo de carga
  final double height;
  final double fontSize;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kDeepOrangeColor,
    this.textColor = Colors.black,
    this.dimension = 0.8,
    this.loading = false,
    this.height = 60,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: size.width * dimension,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        // ignore: deprecated_member_use
        child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: color,
            onPressed: press,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                    
                  style: TextStyle(color: textColor, fontFamily: 'Raleway', fontSize: fontSize,),
                ),
                //Si se ha realizado alguna busqueda
                if (loading)
                  Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.only(left: 20),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
              ],
            )),
      ),
    );
  }
}
