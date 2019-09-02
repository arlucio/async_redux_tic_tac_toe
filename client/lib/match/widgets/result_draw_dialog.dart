import 'package:flutter/material.dart';

/// Dialog that appears on draw
Future<AlertDialog> resultDrawDialog(BuildContext context,
    Function(bool isFirstPlayerToLeave, BuildContext context) onExit, VoidCallback onNewMatch) async {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return AlertDialog(
          title: Column(children: <Widget>[
            Text('DRAW!'),
          ]),
          actions: <Widget>[
            FlatButton(onPressed: () => onNewMatch(), child: Text("NEW MATCH")),
            FlatButton(onPressed: () => onExit(true, context), child: Text("EXIT GAME"))
          ]);
    },
  );
}
