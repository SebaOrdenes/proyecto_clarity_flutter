import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:flutter_auth/services/registroService.dart';

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

  bool loading = false; //circulo de carga

  //Se crea el usuario y se guarda en la base de datos
  void createUser() async {
    setState(() {
      loading = true;
    });
    await guardarUserData();

    setState(() {
      loading = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ),
    );
  }

  //Se guarda el usuario en la base de datos
  Future<void> guardarUserData() async {
    RegistroService registro = new RegistroService();
    await registro.postUser(
        this.name, this.password, this.username, this.email, this.testResults);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.3),
            RoundedInputField(
              icon: Icons.person_outline_rounded,
              hintText: "Nombre",
              onChanged: (value) {
                setState(() => {this.name = value.trim()});
              },
            ),
            RoundedInputField(
              helperText: 'Nombre que usarás para ingresar',
              icon: Icons.spa_outlined,
              hintText: "Usuario",
              onChanged: (value) {
                setState(() => {this.username = value.trim()});
              },
            ),
            RoundedInputField(
              icon: Icons.alternate_email_rounded,
              hintText: "Tu Email",
              onChanged: (value) {
                setState(() => {this.email = value.trim()});
              },
            ),
            RoundedPasswordField(
              helperText: 'Contraseña mínima 8 caracteres',
              onChanged: (value) {
                setState(() => {this.password = value.trim()});
              },
            ),
            RoundedButton(
              text: "Registrar",
              loading: loading,
              press: () {
                createUser();
              },
            ),
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
