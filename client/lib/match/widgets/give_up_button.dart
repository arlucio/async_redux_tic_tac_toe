import 'package:flutter/material.dart';

Widget giveUpButton(BuildContext context, Function(bool isFirstPlayerToLeave, BuildContext context) onExit) {
  return ButtonTheme(
    minWidth: 100.0,
    height: 40.0,
    child: RaisedButton(
        color: Colors.red.shade400,
        onPressed: () => onExit(true, context),
        child: Text('I GIVE UP', style: TextStyle(color: Colors.white, fontSize: 14.0)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
  );
}
