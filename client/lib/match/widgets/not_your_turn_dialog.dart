import 'package:flutter/material.dart';

void notYourTurnDialog(BuildContext context, String visitingPlayerName) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
        title: Column(
          children: <Widget>[
            Text("Calm down!"),
          ],
        ),
        content: RichText(
            text: TextSpan(
                text: "\nIt's not your turn yet! \n\nWait while ",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                children: <TextSpan>[
              TextSpan(
                text: '$visitingPlayerName',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' is thinking on an foolproof AMAZING strategy.',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
              )
            ])),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"))
        ]),
  );
}
