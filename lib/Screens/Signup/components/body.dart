import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Para_ti/para_ti_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
//import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
//import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
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
  Users user;
  String name;
  String password;
  String username;
  String email;
  String testResults = "0";

  void createUser() {
    user = new Users(
        this.name, this.username, this.password, this.email, this.testResults);
    user.postUser(name, password, username, email, testResults);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.43),
            RoundedInputField(
              hintText: "User name",
              onChanged: (value) {
                setState(() => {this.name = value, this.username = value});
              },
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                setState(() => {this.email = value});
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                setState(() => {this.password = value});
              },
            ),
            RoundedButton(
              text: "INGRESAR",
              press: () {
                createUser();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ParaTiScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
