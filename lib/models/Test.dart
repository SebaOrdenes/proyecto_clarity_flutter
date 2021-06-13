class Test {
  int testId;
  String respuesta;

  Test({this.testId, this.respuesta});

  static List<Test> getTests() {
    return <Test>[
      Test(testId: 1, respuesta: "respuesta 1"),
      Test(testId: 2, respuesta: "respuesta 2"),
      Test(testId: 3, respuesta: "respuesta 3"),
    ];
  }
}
