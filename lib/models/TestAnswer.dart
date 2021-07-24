import 'Answer.dart';

class TestAnswer {
  String userId;
  //String testName;
  List<int> limitis;
  int category;
  String reply;
  String description;
  String route;
  List<Answer> answers = [];

  //Modifica la lista id's de respuestas
  List<Answer> getTestAnswers(List<String> listIdAnswers) {
    for (String idAnswer in listIdAnswers) {
      Answer a = new Answer(idAnswer);
      this.answers.add(a);
    }
    return this.answers;
  }

  Map<String, dynamic> toJson() => {
        'listAnswers': answers,
      };

  void setDatos(List testResults) {
    this.reply = testResults[0]["reply"];
    this.description = testResults[0]["description"];
    this.route = testResults[0]["route"];
  }
}
