class Answer {
  String id;

  Answer(String id) {
    this.id = id;
  }

  Map<String, String> toJson() {
    return {
      "id": this.id,
    };
  }
}
