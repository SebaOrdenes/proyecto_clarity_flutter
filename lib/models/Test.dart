import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Test {
  String id;
  String item;
  String reply;
  int score;
  int finalScore;
  static List<List<Test>> test = [];
  static List<Test> respuestas = [];

  Test(String id, String reply, String item, int score) {
    this.id = id;
    this.item = item;
    this.reply = reply;
    this.score = score;
  }

  static List<List<Test>> getTest() {
    return test;
  }

  static Future<bool> getPreguntas() async {
    //Ruta con back funcionando /options/api/Test de depresión
    http.Response response = await http
        .get(Uri.http('10.0.2.2:8000', 'api/options/Test de depresión'));
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    List testData = jsonResponse['data'];
    int itemAux = int.parse(testData[0]["item"]);
    for (int i = 0; i < testData.length; i++) {
      //Verificando que se revisó el item
      if (itemAux != int.parse(testData[i]["item"])) {
        itemAux = int.parse(testData[i]["item"]);
        test.add(respuestas); //Se alamcenan las primeras preguntas
        respuestas = [];
      }

      String id = testData[i]["_id"];
      int score = testData[i]["score"];
      String item = testData[i]["item"];
      String reply = testData[i]["reply"];
      Test respuesta = new Test(id, reply, item, score);
      respuestas.add(respuesta);

      //En caso de estar en la última posición
      if (i == testData.length - 1) {
        test.add(respuestas); //Se alamcenan últimas  preguntas
        respuestas = [];
      }
    }

    if (test != null) return true;
    return false;
  }

  void setScore(int finalScore) {
    this.finalScore = finalScore;
  }
}
