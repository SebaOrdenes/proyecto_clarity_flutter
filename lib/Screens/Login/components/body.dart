import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/admin_screen.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Para_ti/para_ti_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Test/test_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:flutter_auth/services/loginService.dart';
import 'package:flutter_auth/services/testService.dart';

//Widget Login
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String username = "";
  String password = "";
  bool state = false; //Verifica si la usuaria ha podido iniciar sesión
  String menssage = ""; //Mensaje al intentar iniciar sesión
  bool isActivated = false;
  bool loading = false; //Permite mostrar circulo de carga

  //Método para iniciar sesión de la usuaria
  loginUser() async {
    LoginService login = new LoginService();
    setLoading(true); //Modificando pantalla de carga
    Map<String, dynamic> validationLog =
        await login.checkUser(this.username, this.password); //Verificando user
    setValidation(validationLog); //Modificando datos de login
    //Si la usuaria existe
    if (state != false && state != null) {
      await login.newUser(
          this.username); //Instanciar usuaria para mostrar datos en front
      setLoading(false); //Modificando pantalla de carga
      showViews(); //Cambiando vista
    }
    setLoading(false); //Modificando pantalla de carga
  }

  //Mostrar vistas tras iniciar sesión
  void showViews() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (Users.username == "Shamyra") {
            return AdminScreen();
          } else
            return ParaTiScreen();
        },
      ),
    );
  }

  void setNameTest(String nameTest) {
    TestService.name = nameTest;
  }

  //----- Métodos con setState ------

  //Modificar circulo de carga
  setLoading(booleanVariable) {
    setState(() {
      loading = booleanVariable;
    });
  }

  //Modificar validaciones de inicio de sesión
  setValidation(validationLog) {
    setState(() {
      state = validationLog["validate"];
      menssage = validationLog["menssage"];
      print("Mensaje: $menssage");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.5),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Tu nombre de usuario",
                //             helperText: "$menssage",
                onChanged: (value) {
                  setState(() => {this.username = value});
                },
              ),
              RoundedPasswordField(
                helperText: "$menssage",
                onChanged: (value) {
                  {
                    setState(() => {this.password = value});
                  }
                },
              ),
              RoundedButton(
                text: "Iniciar sesión",
                loading: loading,
                press: () {
                  loginUser(); //Login Usuaria
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
                  setNameTest("Test de depresión");
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
      ),
    );
  }
}
