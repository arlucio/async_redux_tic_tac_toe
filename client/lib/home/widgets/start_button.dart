import 'package:flutter/material.dart';

Widget startButton(VoidCallback onStart) {
  return ButtonTheme(
      minWidth: 100.0,
      height: 100.0,
      child: RaisedButton(
          elevation: 5.0,
          color: Colors.red.shade400,
          onPressed: onStart,
          child: Text('PLAY', style: TextStyle(color: Colors.indigo.shade50, fontSize: 20.0)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0))));
}
