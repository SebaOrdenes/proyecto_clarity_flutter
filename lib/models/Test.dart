import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Test {
  String id;
  String item;
  String reply;
  int score;
  int finalScore;
  List testData;
  static List<List<Test>> test = [];
  static List<Test> respuestas = [];
  http.Response response;

  Test(String id, String reply, String item, int score) {
    this.id = id;
    this.item = item;
    this.reply = reply;
    this.score = score;
  }

  List<List<Test>> getTest() {
    return test;
  }

  getPreguntas() async {
    http.Response response = await http
        .get(Uri.http('10.0.2.2:8000', '/api/options/Test de depresión'));
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    this.testData = jsonResponse['data'];

    int itemAux = int.parse(testData[0]["item"]);
    for (int i = 0; i < this.testData.length; i++) {
      //Verificando que se revisó el item
      if (itemAux != int.parse(this.testData[i]["item"])) {
        itemAux = int.parse(this.testData[i]["item"]);
        test.add(respuestas); //Se alamcenan las primeras preguntas
        respuestas = [];
      }

      String id = this.testData[i]["_id"];
      int score = this.testData[i]["score"];
      String item = this.testData[i]["item"];
      String reply = this.testData[i]["reply"];
      Test respuesta = new Test(id, reply, item, score);
      respuestas.add(respuesta);

      //En caso de estar en la última posición
      if (i == this.testData.length - 1) {
        test.add(respuestas); //Se alamcenan últimas  preguntas
        respuestas = [];
      }
    }
  }

  void setScore(int finalScore) {
    this.finalScore = finalScore;
  }
}
