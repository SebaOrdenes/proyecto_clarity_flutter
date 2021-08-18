import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Layout/components/background.dart';
import 'package:flutter_auth/Screens/ResultadoTest/resultadoTest_screen.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/models/Question.dart';
import 'package:flutter_auth/models/Test.dart';
import 'package:flutter_auth/models/TestAnswer.dart';
import 'package:flutter_auth/services/testAnswerService.dart';
import 'package:flutter_auth/services/testService.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String ruta = "assets/images/fondo.jpeg";
  TestAnswer testAnswer;
  static Test test;
  List<Question> questions;
  String query; //Consulta en pantalla

  //Atributos para seleccionar respuesta
  int selectedRadio;
  int selectedRadioTile;
  String selectedTest;

  //Atributos para modificar puntaje
  String actualAnswer;
  List<String> answers = [];
  int count = 0;

  //initState se ejecuta antes que se carguen todos los componentes
  @override
  void initState() {
    super.initState();
    test = TestService.getTestByName(); //Obteniendo test por el nombre
    questions = test.getQuestions(); //Obteniendo pregutnas del test
    selectedRadio = 0;
    setQuery(questions[count].query);
  }

  //Guarda las respuestas del test
  storeResultUserTest() async {
    TestAnswerService testService = new TestAnswerService();
    String nameTest = TestService.name;
    String typeTest = "1";
    if (nameTest == "Test quincenal") typeTest = "2";

    //Guardando los resultados de las respuestas
    await testService.storeTestAnswerUser(typeTest, answers);
    List testResult = await testService.getResultadoTest(nameTest);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ResultadoTestScreen(testResult: testResult);
        },
      ),
    );
    //Enviar a otra vista
  }

  void setSelectedTest(String question) {
    setState(() {
      selectedTest = question;
    });
  }

  void setQuery(String query) {
    if (query != null) {
      setState(() {
        this.query = query;
      });
    } else {
      setState(() {
        this.query = "Escoge una de las siguientes opciones:";
      });
    }
  }

  //Wiget para crear lista de RadioButton
  List<Widget> createRadioListTests() {
    List<Widget> widgets = [];
    Question question;
    if (questions[this.count] != null) {
      question = questions[this.count]; //Obteniendo preguntas

    }

    //for (String respuesta in question.listaId) {
    for (int i = 0; i < question.listaId.length; i++) {
      widgets.add(RadioListTile(
          value: question.listaId[i],
          groupValue: selectedTest,
          title: Text(
            question.alternatives[i],
            style: TextStyle(
              fontFamily: 'Raleway',
            ),
          ),
          onChanged: (currentTest) {
            selectedRadio = 1;
            setSelectedTest(currentTest);
            this.actualAnswer = question.listaId[i]; //Guardar puntaje obtenido
          },
          selected: selectedTest == question.listaId[i],
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
                  answers.removeLast(), //Eliminando ultima respuesta escogida
                  setQuery(questions[count].query),
                });
            print(answers);
          }));
    }
    //Si no se encuentra en la última pregunta aparece el botón siguiente
    if (count < questions.length - 1 && selectedRadio != 0) {
      //Agregar el botón siguiente
      widgets.add(RoundedButton(
          text: "Siguiente",
          dimension: 0.4,
          press: () {
            setState(() => {
                  count++,
                  selectedRadio = 0,
                  answers.add(actualAnswer),
                  setQuery(questions[count].query),
                });
            print(answers);

            //createRadioListTests(count);
          }));

      //Si se encuentra en la últma pregunta aparece el botón de envío
    } else if (count == questions.length - 1) {
      //Agregar el botón siguiente
      widgets.add(RoundedButton(
          text: "Enviar",
          dimension: 0.4,
          press: () {
            setState(() => {count = 0});
            answers.add(actualAnswer);
            storeResultUserTest();
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
          height: 150.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(this.ruta), fit: BoxFit.cover),
          ),
          margin: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 1),
          child: Text(
            "${this.query}",
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20.0,
              height: 1.4,
            ),
            textAlign: TextAlign.justify,
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
