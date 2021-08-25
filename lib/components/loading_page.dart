import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage {
  final BuildContext _context;

  LoadingPage(this._context);

  /// Abrir carga
  void show({Function onClosed}) {
    showDialog(
      context: _context,
      builder: (context) {
        return SpinKitFadingCircle(color: Colors.white );
      },
    ).then((value) {
      onClosed(value);
    });
  }

  /// Cerrar carga
  void close() {
    Navigator.of(_context).pop();
  }
}