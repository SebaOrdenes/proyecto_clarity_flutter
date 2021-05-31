import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade300,
      ),
      body: Center(
        child: Text(
          'Bienvenida a Clarity',
          style: TextStyle(fontSize: 30),
        ),
      ),
      backgroundColor: Colors.deepOrange.shade100,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right_alt),
        onPressed: () {}, //funcion anonima
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
