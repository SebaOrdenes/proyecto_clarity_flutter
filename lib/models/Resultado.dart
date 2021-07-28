import 'dart:convert';
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
      String menssageCategoryFour) {
    categoryOne = categoryOne;
    categoryTwo = categoryTwo;
    categoryThree = categoryThree;
    categoryFour = categoryFour;
    scoreSum = scoreSum;
  }

  Future<Resultado> getResultado() async {
    http.Response response = await http
        .post(Uri.http('10.0.2.2:8000', 'api/users/statisticalMeasures'));

    Map<String, dynamic> usersData =
        new Map<String, dynamic>.from(json.decode(response.body));
    //categoryOne = usersData['category'];
    menssageCategoryOne = usersData['menssageCategoryOne'];
    menssageCategoryTwo = usersData['menssageCategoryTwo'];
    menssageCategoryThree = usersData['menssageCategoryThree'];
    menssageCategoryFour = usersData['menssageCategoryFour'];

    //print(menssageCategoryThree);
  }
}
