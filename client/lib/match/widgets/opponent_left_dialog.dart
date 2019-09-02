import 'package:flutter/material.dart';

/// Dialog appears only for the player who wasn't the first one to leave match
void opponentLeftDialog(
  BuildContext context,
  Function(bool isFirstPlayerToLeave, BuildContext context) onExit,
) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
        title: Column(children: <Widget>[
          Text("Your opponent left the match"),
        ]),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                onExit(false, context);
              },
              child: Text("OK"))
        ]),
  );
}
