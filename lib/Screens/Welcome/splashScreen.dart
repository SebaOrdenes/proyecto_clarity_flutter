import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/models/Test.dart';

//Clase SplashScreen del tipo Stateful
//Utilizar para verificar si la usuaria se encuentra registrada y otros datos
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String texto = "";

  //initState es un método de Stateful que se construye cuando inicia la clase
  //Tras cargar todo lo necesario, se abre la vista WelcomeScreen
  @override
  void initState() {
    getData();
    super.initState();
  }

  //Obteniendo datos antes de cargar la aplicación
  Future<void> getData() async {
    await Test.getPreguntas(); //Petición a back de los tests
    setText("Obteniendo Tests");
    setScreen();
  }

  //Cambiando a la vista de bienvenida
  setScreen() {
    //Se utiliza  WidgetsBinding.instance.addPostFrameCallback porque genera error sin esto (solucionar)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WelcomeScreen();
          },
        ),
      );
    });
  }

  //Cambiando texto de carga
  setText(value) {
    setState(() => {this.texto = value});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          //Ajustar al tamaño de pantalla de cualquier celular
          child: FractionallySizedBox(
              widthFactor: .6,
              child: Image.asset(
                'assets/images/Claritylogo.png', scale: 1.5,
                //width: 150.0,
                // alignment: Alignment.bottomLeft,
              )),
        ),
        Text(texto)
      ],
    )));
  }
}
