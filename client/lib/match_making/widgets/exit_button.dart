import 'package:flutter/material.dart';

ButtonTheme exitButton(VoidCallback onExit) {
  return ButtonTheme(
    minWidth: 100.0,
    height: 40.0,
    child: RaisedButton(
        color: Colors.red.shade400,
        onPressed: () => onExit(),
        child: Text('I GIVE UP', style: TextStyle(color: Colors.white, fontSize: 12.0)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
  );
}
