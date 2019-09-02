import 'package:flutter/material.dart';

ButtonTheme newRandomNameButton(VoidCallback generateNewRandomName) {
  return ButtonTheme(
      child: RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    child: Text(
      'NEW RANDOM NAME',
      maxLines: 3,
      style: TextStyle(color: Colors.white, fontSize: 14.0),
    ),
    color: Colors.indigo.shade500,
    elevation: 5.0,
    onPressed: () => generateNewRandomName(),
  ));
}
