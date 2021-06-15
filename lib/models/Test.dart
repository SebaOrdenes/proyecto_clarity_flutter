import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Test {
  String id;
  String reply;
  List testData;
  http.Response response;

  Test({
    this.id,
    this.reply,
  });

  static List<List<Test>> getTests() {
    List<List<Test>> test = [];
    List<Test> respuestas = [];

    respuestas.add(Test(id: '1', reply: "respuesta 1"));
    respuestas.add(Test(id: '2', reply: "respuesta 2"));
    respuestas.add(Test(id: '3', reply: "respuesta 3"));
    test.add(respuestas);
    respuestas = [];
    respuestas.add(Test(id: '4', reply: "respuesta 4"));
    respuestas.add(Test(id: '5', reply: "respuesta 5"));
    respuestas.add(Test(id: '6', reply: "respuesta 6"));
    test.add(respuestas);
    respuestas = [];
    respuestas.add(Test(id: '7', reply: "respuesta 7"));
    respuestas.add(Test(id: '8', reply: "respuesta 8"));
    respuestas.add(Test(id: '9', reply: "respuesta 9"));
    test.add(respuestas);

    return test;
  }

  var ruta = 'http://localhost:8000/api/options/';
  getUsers() async {
    List<List<Test>> test = [];
    List<Test> respuestas = [];

    http.Response response =
        await http.get(Uri.http('10.0.2.2:3000', '/api/options'));
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    this.testData = jsonResponse['data'];
  }
}
