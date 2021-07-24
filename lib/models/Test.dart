import 'Question.dart';

class Test {
  String testName;
  List<Question> questions = [];

  Test(String nombreTest) {
    this.testName = nombreTest;
  }

  void addQuestion(
      String item, List<String> listaId, List<String> alternatives, String query) {
    Question question = new Question(item, listaId, alternatives, query);
    print(question.listaId[0]);
    questions.add(question);
  }

  String getTestName() {
    return this.testName;
  }

  List<Question> getQuestions() {
    return this.questions;
  }
}
