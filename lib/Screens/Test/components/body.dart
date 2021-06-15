import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Informacion/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/models/Test.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String ruta = "assets/images/Flowers_edited.png";
  List<List<Test>> test = [];
  int selectedRadio;
  int selectedRadioTile;
  Test selectedTest;
  int count = 0;

  //initState se ejecuta antes que se carguen todos los componentes
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    test = Test.getTests();
  }

  void setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  void setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  void setSelectedTest(Test test) {
    setState(() {
      selectedTest = test;
    });
  }

  //Wiget para crear lista de RadioButton
  List<Widget> createRadioListTests() {
    List<Widget> widgets = [];
    List<Test> question = test[this.count]; //Obteniendo preguntas
    for (Test respuesta in question) {
      widgets.add(RadioListTile(
          value: respuesta,
          groupValue: selectedTest,
          title: Text(respuesta.reply),
          onChanged: (currentTest) {
            print('Current Test ${currentTest.reply}');
            print(respuesta.response);
            setSelectedTest(currentTest);
            //respuesta.getUsers();
          },
          selected: selectedTest == respuesta,
          activeColor: Color.fromRGBO(255, 195, 177, 1)));
    }

    return widgets;
  }

  //Widget para mostrar botones: atrás, siguiente y enviar
  List<Widget> createButtonTest() {
    List<Widget> widgets = [];

    //Si no se encuentra en la primera pregunta aparece el botón atrás
    if (count > 0) {
      widgets.add(
        RoundedButton(
            text: "Atrás",
            dimension: 0.4,
            press: () {
              setState(() => {count--});
              //createRadioListTests(count);
            }),
      );
    }
    //Si no se encuentra en la última pregunta aparece el botón siguiente
    if (count < test.length - 1) {
      //Agregar el botón siguiente
      widgets.add(RoundedButton(
          text: "Siguiente",
          dimension: 0.4,
          press: () {
            setState(() => {count++});
            //createRadioListTests(count);
          }));

      //Si se encuentra en la últma pregunta aparece el botón de envío
    } else {
      //Agregar el botón siguiente
      widgets.add(RoundedButton(
          text: "Enviar",
          dimension: 0.4,
          press: () {
            setState(() => {count = 0});
          }));
    }

    return widgets;
  }

  //Mostrar Todos los widgets en pantalla
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(this.ruta), fit: BoxFit.cover)),
          padding: EdgeInsets.only(top: 50.0),
          child: Text(
            "Escoge una de las \n siguientes opciones:",
            style: TextStyle(
              fontSize: 30.0,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
            child: Column(
          children: createRadioListTests(),
        )),
        Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: createButtonTest(),
            ))
      ],
    ));
  }
}
