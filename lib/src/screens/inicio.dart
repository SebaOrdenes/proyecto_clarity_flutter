import 'package:flutter/material.dart';
import 'package:proyecto_clarity_flutter/src/providers/menu_provider.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    menuProvider.cargarData().then((opciones) {
      print('_lista');
      print('hola');
    });
    //print(menuProvider.opciones);

    return ListView(
      children: _listaItems(),
    );
  }

  List<Widget> _listaItems() {
    return [
      ListTile(title: Text('Para ti')),
      ListTile(title: Text('Medicion')),
      ListTile(title: Text('Información')),
      ListTile(title: Text('Tratamiento')),
      ListTile(title: Text('Revitalizar')),
    ];
  }
}
