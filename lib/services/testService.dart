import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

//Clase relacionada a los test realizados por la clienta
class TestService {
  static List<Test> listTest = [];
  static String name;

  //Obtener las preguntas del test
  Future<bool> getPreguntas(String nameTest) async {
    Test test = new Test(nameTest);
    List<String> alternatives = []; //Lista de alternativas
    List<String> listId = [];
    String query;
    String item;

    //Ruta con back funcionando /options/api/Test de depresión
    http.Response response =
        await http.get(Uri.http(ip, 'api/options/$nameTest'));
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    List testData = jsonResponse['data'];
    int itemAux = int.parse(testData[0]["item"]);
    for (int i = 0; i < testData.length; i++) {
      //Verificando que se revisó el item
      if (itemAux != int.parse(testData[i]["item"])) {
        itemAux = int.parse(testData[i]["item"]);
        test.addQuestion(item, listId, alternatives,
            query); //Se almacenan las primeras preguntas
        alternatives = [];
        listId = [];
      }

      String id = testData[i]["_id"];
      item = testData[i]["item"];
      String reply = testData[i]["reply"];
      if (nameTest == "Test quincenal") {
        query = testData[i]["question"];
      }
      alternatives.add(reply);
      listId.add(id);

      //En caso de estar en la última posición
      if (i == testData.length - 1) {
        test.addQuestion(item, listId, alternatives,
            query); //Se alamcenan últimas  preguntas
        alternatives = [];
        listId = [];
      }
    }

    if (test != null) {
      listTest.add(test);
      print(listTest);
      return true;
    }

    return false;
  }

  //Obtener test de lista de test según nombre
  static Test getTestByName() {
    if (listTest != null) {
      for (Test test in listTest) {
        if (test.getTestName() == name) {
          return test;
        }
      }
    }
    return null;
  }
}
