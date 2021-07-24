class Question {
  String item;
  List<String> listaId;
  List<String> alternatives;
  String query;

  Question(String item, List<String> listaId, List<String> alternatives, String query) {
    this.item = item;
    this.listaId = listaId;
    this.alternatives = alternatives;
    this.query = query;
  }
}
