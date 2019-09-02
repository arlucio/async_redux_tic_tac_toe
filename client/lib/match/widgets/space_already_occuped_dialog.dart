import 'package:flutter/material.dart';

Future<AlertDialog> spaceAlreadyOccupiedDialog(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
        title: Column(children: <Widget>[
          Text("This space is already ocupied!"),
        ]),
        content: Text("\nTry other one!"),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"))
        ]),
  );
}
