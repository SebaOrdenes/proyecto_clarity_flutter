import 'dart:convert';
import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;

class Resultado {
  var categoryOne = [];
  var categoryTwo = [];
  var categoryThree = [];
  var categoryFour = [];
  var scores = [];
  String menssageCategoryOne;
  String menssageCategoryTwo;
  String menssageCategoryThree;
  String menssageCategoryFour;
  String menssageScore1;

  var scoreSum = 0;
  var averageScore = 0;

  Resultado(
      var categoryOne,
      var categoryTwo,
      var categoryThree,
      var categoryFour,
      var scores,
      String menssageCategoryOne,
      String menssageCategoryTwo,
      String menssageCategoryThree,
      String menssageCategoryFour,
      String menssageScore1) {
    categoryOne = categoryOne;
    categoryTwo = categoryTwo;
    categoryThree = categoryThree;
    categoryFour = categoryFour;
    scoreSum = scoreSum;
    menssageScore1 = menssageScore1;
  }

  // ignore: missing_return
  Future<Resultado> getResultado() async {
    http.Response response =
        await http.post(Uri.http(ip, 'api/users/statisticalMeasures'));

    Map<String, dynamic> usersData =
        new Map<String, dynamic>.from(json.decode(response.body));
    //categoryOne = usersData['category'];
    menssageCategoryOne = usersData['menssageCategoryOne'];
    menssageCategoryTwo = usersData['menssageCategoryTwo'];
    menssageCategoryThree = usersData['menssageCategoryThree'];
    menssageCategoryFour = usersData['menssageCategoryFour'];

    //print(menssageCategoryThree);
  }

  // ignore: missing_return
  Future<Resultado> getResultado2() async {
    http.Response response =
        await http.post(Uri.http(ip, 'api/users/statisticalMeasures2'));

    Map<String, dynamic> usersData =
        new Map<String, dynamic>.from(json.decode(response.body));
    //categoryOne = usersData['category'];
    menssageCategoryOne = usersData['menssageCategoryOne'];
    menssageCategoryTwo = usersData['menssageCategoryTwo'];
    menssageCategoryThree = usersData['menssageCategoryThree'];
    menssageCategoryFour = usersData['menssageCategoryFour'];
    menssageScore1 = usersData['menssageScore1'];
  }
}
