import 'package:flutter/material.dart';

/// Dialog appears only for the player who left match first
void matchIsOverDialog(BuildContext context, VoidCallback sendPlayerHome) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
        title: Column(children: <Widget>[
          Text("Match is over!"),
        ]),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                sendPlayerHome();
              },
              child: Text("OK"))
        ]),
  );
}
