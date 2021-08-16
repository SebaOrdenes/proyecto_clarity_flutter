import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/Answer.dart';
import 'package:flutter_auth/models/TestAnswer.dart';
import 'package:flutter_auth/models/Users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Clase relacionada a las respuesta de los test
class TestAnswerService {
  //Guarda las respuestas en un usuario
  Future<void> storeTestAnswerUser(
      String typeTest, List<String> idAnswers) async {
    //Obteniendo respuestas
    TestAnswer testAnswer = new TestAnswer();
    List<Answer> answers = testAnswer.getTestAnswers(idAnswers);

    String userId = Users.id;
    Map<String, dynamic> map = testAnswer.toJson();
    Map<String, dynamic> args = {"data": map};
    var jsonString = jsonEncode(args);

    if (answers != null) {
      try {
        http.Response response = await http.put(
          Uri.http(ip, '/api/users/$userId/$typeTest'),
          body: jsonString,
          headers: {'Content-type': 'application/json'},
        );
      } catch (e) {
        print(e);
      }
    }
  }

  Future<List<dynamic>> getResultadoTest(String nameTest) async {
    String userId = Users.id;
    http.Response response =
        await http.get(Uri.http(ip, '/api/users/$userId/$nameTest'));
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    List<dynamic> resultadoTest = jsonResponse['data'];
    return resultadoTest;
  }
}
