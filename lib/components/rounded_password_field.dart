import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String helperText;
  final bool obscureText;
  final String errorText;

  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.helperText,
    this.obscureText = true,
    this.errorText,
  }) : super(key: key);
  @override
  _RoundedPasswordField createState() => _RoundedPasswordField();
}

class _RoundedPasswordField extends State<RoundedPasswordField> {
  ValueChanged<String> onChanged;
  String helperText;
  bool obscureText;
  IconData visibility;
  String tooltip;
  String errorText;

  void initState() {
    super.initState();
    this.onChanged = widget.onChanged;
    this.helperText = widget.helperText;
    this.obscureText = widget.obscureText;
    this.visibility = Icons.visibility;
    this.tooltip = "Mostrar contraseña";
    this.errorText = widget.errorText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: obscureText,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          helperText: helperText,
          errorText: errorText,
          hintText: "Contraseña",
          icon: Icon(
            Icons.lock_outline_rounded,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            splashColor:
                Colors.transparent, //No muestra circulo tras presionar botón
            tooltip: this.tooltip,
            icon: Icon(
              this.visibility,
              color: kPrimaryColor,
            ),
            onPressed: () {
              setState(
                () {
                  if (this.obscureText == true) {
                    this.obscureText = false;
                    this.visibility = Icons.visibility_off;
                    this.tooltip = "Mostrar contraseña";
                  } else {
                    this.obscureText = true;
                    this.visibility = Icons.visibility;
                    this.tooltip = "Ocultar contraseña";
                  }
                },
              );
            },
          ),
          // border: InputBorder.none,
        ),
      ),
    );
  }
}
