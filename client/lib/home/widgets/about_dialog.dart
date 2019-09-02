import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void aboutDialog(BuildContext context) async {
  showAboutDialog(
      context: context,
      applicationName: "Tic Tac Toe",
      applicationVersion: 'September 2019 @ André Lúcio',
      applicationIcon: Image.asset("assets/images/hash_logo.png", width: 80.0),
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  style: TextStyle(color: Colors.black, fontFamily: 'GoogleSans', fontWeight: FontWeight.bold),
                  text: 'App developed by André Lúcio as a Flutter showcase '
                      'using async_redux © Marcelo Glasberg'),
              TextSpan(
                  style: TextStyle(color: Colors.black, fontFamily: 'GoogleSans', fontWeight: FontWeight.w600),
                  text: '\n\nCheck this App source code at: '),
              _LinkTextSpan(
                  style: TextStyle(
                      color: Colors.blue, fontFamily: 'GoogleSans', fontWeight: FontWeight.bold, fontSize: 13.0),
                  text: '\n\ngithub.com/arlucio/async_redux_tic_tac_toe',
                  url: 'https://github.com/arlucio/async_redux_tic_tac_toe'),
              TextSpan(
                  style: TextStyle(color: Colors.black, fontFamily: 'GoogleSans', fontWeight: FontWeight.w600),
                  text: '\n\nCheck async_redux package at:'),
              _LinkTextSpan(
                  style: TextStyle(
                      color: Colors.blue, fontFamily: 'GoogleSans', fontWeight: FontWeight.bold, fontSize: 13.0),
                  text: '\n\ngithub.com/marcglasberg/async_redux',
                  url: 'https://github.com/marcglasberg/async_redux'),
            ])))
      ]);
}

/// Helper Class to add an clickable link to a RichText
class _LinkTextSpan extends TextSpan {
  _LinkTextSpan({TextStyle style, String url, String text})
      : super(
            style: style,
            text: text ?? url,
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              });
}
