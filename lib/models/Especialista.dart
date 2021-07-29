class Especialista {
  String id;
  String name;
  String image;
  List<dynamic> role; //
  String speciality;
  List<dynamic> hoursUnAvailableFCIOTOS;
  List<dynamic> hoursUnAvailableFAIGS;
  List<dynamic> hoursUnAvailableFAIW;

  Especialista(
      String id,
      String name,
      String image,
      List<dynamic> role, //0: 1 - 1
      String speciality,
      List<dynamic> hoursUnAvailableFCIOTOS,
      List<dynamic> hoursUnAvailableFAIGS,
      List<dynamic> hoursUnAvailableFAIW) {
    this.id = id;
    this.name = name;
    this.image = image;
    this.speciality = speciality;
    this.role = role;
    this.speciality = speciality;
    this.hoursUnAvailableFCIOTOS = hoursUnAvailableFCIOTOS;
    this.hoursUnAvailableFAIGS = hoursUnAvailableFAIGS;
    this.hoursUnAvailableFAIW = hoursUnAvailableFAIW;
  }
}
