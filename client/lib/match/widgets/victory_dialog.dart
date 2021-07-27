import 'dart:convert';

import 'package:business/match/model/quote_model.dart';
import 'package:business/match/model/serializers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Dialog that appears on victory. Also does some API action.
///
Future<AlertDialog> victoryDialog(
    BuildContext context,
    String winnerPlayer,
    String homePlayerID,
    Function(bool isFirstPlayerToLeave, BuildContext context) onExit,
    VoidCallback onNewMatch) async {
  var response = await http.get(Uri.parse("https://api.forismatic.com/api/1"
      ".0/?method=getQuote&format=json&lang=en"));
  final parsed =
      json.decode(response.body.replaceAll(r"\'", "'").replaceAll(r"\~'", "~"));
  var quote = standardSerializers.deserializeWith(Quote.serializer, parsed);

  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
            title: Column(children: <Widget>[
              (winnerPlayer == homePlayerID)
                  ? Text('You are the winner!')
                  : Text('You lost the game!'),
            ]),
            content: (winnerPlayer == homePlayerID)
                ? RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text:
                            "\nAs your award, here is an inspiring message for you: ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\n\n${quote.quoteText}',
                            style: _quoteStyle,
                          ),
                          TextSpan(
                            text: '\n${quote.quoteAuthor}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ]))
                : RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text:
                            "\nBetter luck next time! Here is an inspiring message to keep you motivated:",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\n\n${quote.quoteText}',
                            style: _quoteStyle,
                          ),
                          TextSpan(
                            text: '\n${quote.quoteAuthor}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ])),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => onNewMatch(), child: Text("NEW MATCH")),
              FlatButton(
                  onPressed: () => onExit(true, context),
                  child: Text("EXIT GAME"))
            ]);
      });
}

final _quoteStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w100,
    fontStyle: FontStyle.italic);
