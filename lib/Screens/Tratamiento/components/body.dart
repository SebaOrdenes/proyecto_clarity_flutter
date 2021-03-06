import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Especialistas/especialistas_screen.dart';
import 'package:flutter_auth/Screens/SesionGrupal/sesionGrupal_screen.dart';
import 'package:flutter_auth/Screens/Videos/videos_screen.dart';
import 'package:flutter_auth/Screens/Workshop/workshop_screen.dart';
import 'package:flutter_auth/components/loading_page.dart';
import 'package:flutter_auth/models/Videos.dart';
import 'package:flutter_auth/services/especialistaService.dart';
import 'package:flutter_auth/services/sesionGrupalService.dart';
import 'package:flutter_auth/services/workshopService.dart';

import '../../../constants.dart';

//import 'package:flutter_auth/constants.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  EspecialistaService especialistaService;
  WorkshopService workshopService;
  SesionGrupalService sesionGrupalService;

  getVideos() async {
    Video videos = new Video(descripcion: '', titulo: '', url: '');
    await videos.getVideos();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return VideoScreen();
        },
      ),
    );
  }

  //Cambiar a vista especialistas
  getEspecialistas() async {
    especialistaService = new EspecialistaService();
    print(EspecialistaService.listaEspecialistas);

    //Inicio de carga
    LoadingPage loadingPage = LoadingPage(context);
    loadingPage.show();
    await especialistaService.getEspecialistas();
    //Fin de carga
    loadingPage.close();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EspecialistasScreen();
        },
      ),
    );
  }

  //Cambiar a vista workshop
  getWorkshops() async {
    workshopService = new WorkshopService();

    //Inicio de carga
    LoadingPage loadingPage = LoadingPage(context);
    loadingPage.show();
    await workshopService.getWorkshops();
    //Fin de carga
    loadingPage.close();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WorkshopScreen();
        },
      ),
    );
  }

  //Cambiar a vista Sesion grupal
  getSesionGrupal() async {
    sesionGrupalService = new SesionGrupalService();

    //Inicio de carga
    LoadingPage loadingPage = LoadingPage(context);
    loadingPage.show();
    await sesionGrupalService.getSesionesGrupales();
    //Fin de carga
    loadingPage.close();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SesionGrupalScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: ListView(
          children: [
            SizedBox(height: size.height * 0.05),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fondo.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Tratamiento1.png',
                    width: 200,
                    height: 110,
                  ),
                  Text(
                    'Hemos integrado diferentes alternativas psicoterap??uticas '
                    'para acompa??arte en tu camino de transformaci??n.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: 'Raleway',
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  highlightColor: Colors.white,
                  onTap: () {
                    getVideos();
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/images/Individual.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                InkWell(
                  highlightColor: Colors.white,
                  onTap: () {
                    return getEspecialistas();
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/images/Especialista.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  highlightColor: Colors.white,
                  onTap: () {
                    return getSesionGrupal();
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/images/Grupos.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                InkWell(
                  highlightColor: Colors.white,
                  onTap: () {
                    return getWorkshops();
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/images/Workshops.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    /*Background(
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 400,
              left: 30,
              child: InkWell(
                onTap: null,
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Grupos.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              )),
          Positioned(
              top: 250,
              left: 30,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return VideoScreen();
                        //return VideoListScreen();
                      },
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Individual.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              )),
          Positioned(
              top: 250,
              left: 200,
              child: InkWell(
                onTap: () {
                  getEspecialistas();
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Especialista.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              )),
          Positioned(
              top: 400,
              left: 200,
              child: InkWell(
                onTap: () {
                  getWorkshops();
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Workshops.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              )),
          Positioned(
              top: -40,
              left: 65,
              child: Image.asset(
                'assets/images/Tratamiento1.png',
                width: 250,
                height: 250,
              )),
          Positioned(
              top: 170,
              left: 20,
              child: Text(
                ' Hemos integrado diferentes alternativas psicoterap??uticas',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'Raleway',
                ),
              ),
              ),
          Positioned(
              top: 190,
              left: 30,
              child: Text(
                ' para acompa??arte en tu camino de transformaci??n.',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'Raleway',
                ),
              ))
        ],
      ),
    );*/
  }
}
