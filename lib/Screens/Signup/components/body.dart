import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:flutter_auth/services/registroService.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Users user;
  String name = "";
  String password = "";
  String username = "";
  String email = "";
  String testResults = "0";
  String helperName = "Tu nombre y apellido";
  String helperPassword = "Contraseña mínima de 8 caracteres";
  String helperUserName ="Nombre que usarás para ingresar";
  String helperEmail = "Tu correo electrónico";
  String errorTextName = "";
  String errorTextUserName = "";
  String errorTextEmail = "";
  String errorTextPassword = "";

  bool loading = false; //circulo de carga

  //Se crea el usuario y se guarda en la base de datos
  void createUser() async {
    if(this.name != "" && this.username != "" && this.email != "" && this.password != ""){
      setState(() {
        loading = true;
      });
     String menssage =  await guardarUserData();
      setState(() {
        loading = false;
      });
      //Si el usuario ha sido creado
      if(menssage != "Usuario no creado"){
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
      );
      }
      else{
        setState(() {
          errorTextUserName = "Usuaria existente";
        });
      }

    }
    else {
      setHelper();
    }
  }

  //Se guarda el usuario en la base de datos
  Future<String> guardarUserData() async {
    RegistroService registro = new RegistroService();
    Map<String, dynamic> response = await registro.postUser(
        this.name, this.password, this.username, this.email, this.testResults);
    return response["menssage"];
  }

  //Comprueba si se han enviado todos los datos
  setHelper(){
    if(this.name == ""){
      setState(() {
       this.errorTextName = "Campo vacío: debes ingresar un nombre";
      });
    }
    if(this.username == ""){
      setState(() {
        this.errorTextUserName = "Campo vacío: debes ingresar una usuaria";
      });
    }
    if(this.email == ""){
      setState(() {
        this.errorTextEmail = "Campo vacío: debes ingresar un correo";
      });
    }
    if(this.password == ""){
      setState(() {
        this.errorTextPassword = "Campo vacío: debes ingresar una contraseña";
      });
    }
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
              helperText: helperName,
              errorText: errorTextName,
              icon: Icons.person_outline_rounded,
              hintText: "Nombre",
              onChanged: (value) {
                setState(() => {this.name = value.trim()});
              },
            ),
            RoundedInputField(
              helperText: helperUserName,
              errorText: this.errorTextUserName,
              icon: Icons.spa_outlined,
              hintText: "Usuario",
              onChanged: (value) {
                setState(() => {this.username = value.trim()});
              },
            ),
            RoundedInputField(
              helperText: helperEmail,
              errorText: errorTextEmail,
              icon: Icons.alternate_email_rounded,
              hintText: "Tu Email",
              onChanged: (value) {
                setState(() => {this.email = value.trim()});
              },
            ),
            RoundedPasswordField(
              helperText: helperPassword,
              errorText: errorTextPassword,
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
