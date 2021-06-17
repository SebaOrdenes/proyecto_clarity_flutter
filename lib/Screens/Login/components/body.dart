import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Para_ti/para_ti_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Test/test_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/models/Users.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String username;
  String password;
  Users user;
  int state = 0; //Verifica si el usuario se ha podido loguear
  String menssage = ""; //Mensaje al intentar logear

  void loginUser() async {
    user = new Users("", "", "", "", "0");
    await user.login(this.username,
        this.password); //Se debe esperar a hacer la consulta al back
    state = user.getValidation()["validation"];
    menssage = user.getValidation()["menssage"];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.5),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Tu nombre de usuario",
              helperText: "$menssage",
              onChanged: (value) {
                setState(() => {this.username = value});
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                {
                  setState(() => {this.password = value});
                }
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                loginUser(); //Login Usuario
                if (state != 0) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ParaTiScreen();
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TestScreen();
                    },
                  ),
                );
              },
              child: Text('Deseas probar nuestros test? Haz click aqui'),
            )
          ],
        ),
      ),
    );
  }
}
