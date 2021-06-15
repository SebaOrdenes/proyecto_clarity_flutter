import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Test {
  String id;
  int item;
  String reply;
  List testData;
  List<List<Test>> test = [];
  List<Test> respuestas = [];
  http.Response response;

  Test(String id, String reply, int item) {
    this.id = id;
    this.item = item;
    this.reply = reply;
  }

  static List<List<Test>> getTest() {}

  var ruta = 'http://localhost:8000';
  getPreguntas() async {
    http.Response response = await http
        .get(Uri.http('10.0.2.2:8000', '/api/options/Test de depresión'));
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    this.testData = jsonResponse['data'];
    print(testData);

    for (int i = 0; i < this.testData.length; i++) {
      String id = this.testData[i]["_id"];
      int item = this.testData[i]["item"];
      String reply = this.testData[i]["reply"];
      Test respuesta = new Test(id, reply, item);
      respuestas.add(respuesta);
    }
  }
}
