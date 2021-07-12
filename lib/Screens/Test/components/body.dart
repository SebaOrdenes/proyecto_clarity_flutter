import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Layout/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/models/Test.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String ruta = "assets/images/Flowers_edited.png";
  Test test;
  static List<List<Test>> testList = [];
  //Atributos para seleccionar respuesta
  int selectedRadio;
  int selectedRadioTile;
  Test selectedTest;

  //Atributos para modificar puntaje
  int actualScore = 0; //Puntaje de la casilla actual seleccionada
  int previousScore = 0; //Puntaje de la casilla anterior seleccionada
  int finalScore = 0;
  int count = 0;

  //initState se ejecuta antes que se carguen todos los componentes
  @override
  void initState() {
    super.initState();
    testList = Test.getTest();
    selectedRadio = 0;
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

  void createTest() {}

  //Wiget para crear lista de RadioButton
  List<Widget> createRadioListTests() {
    List<Widget> widgets = [];
    List<Test> question = [];
    if (testList[this.count] != null) {
      question = testList[this.count]; //Obteniendo preguntas
    }

    for (Test respuesta in question) {
      widgets.add(RadioListTile(
          value: respuesta,
          groupValue: selectedTest,
          title: Text(respuesta.reply),
          onChanged: (currentTest) {
            selectedRadio = 1;
            setSelectedTest(currentTest);
            actualScore = currentTest.score; //Guardar puntaje obtenido
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
      widgets.add(RoundedButton(
          text: "Atrás",
          dimension: 0.4,
          press: () {
            setState(() => {
                  count--,
                  selectedRadio = 0,
                  finalScore = finalScore - actualScore, //Aumentar el puntaje
                  actualScore =
                      previousScore, //Se asigna el puntaje actual como anterior});
                  //createRadioListTests(count);
                });
          }));
    }
    //Si no se encuentra en la última pregunta aparece el botón siguiente
    if (count < testList.length - 1 && selectedRadio != 0) {
      //Agregar el botón siguiente
      widgets.add(RoundedButton(
          text: "Siguiente",
          dimension: 0.4,
          press: () {
            setState(() => {
                  count++,
                  selectedRadio = 0,
                  finalScore = finalScore + actualScore, //Aumentar el puntaje
                  previousScore =
                      actualScore, //Se asigna el puntaje actual como anterior
                });

            //createRadioListTests(count);
          }));

      //Si se encuentra en la últma pregunta aparece el botón de envío
    } else if (count == testList.length - 1) {
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
