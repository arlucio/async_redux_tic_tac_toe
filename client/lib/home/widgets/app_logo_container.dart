import 'package:align_positioned/align_positioned.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container appLogoContainer() {
  return Container(
      height: 110,
      width: 300,
      child: Stack(
        children: <Widget>[
          Text(
            'Tic Tac Toe',
            style: _appLogoStyle,
            textAlign: TextAlign.center,
          ),
          AlignPositioned(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('made with:', style: _madeWithStyle),
                  FlutterLogo(
                    style: FlutterLogoStyle.horizontal,
                    size: 80.0,
                    textColor: Colors.indigo.shade900,
                  ),
                ],
              )),
        ],
      ));
}

TextStyle _appLogoStyle = TextStyle(
  fontSize: 40.0,
  color: Colors.indigo.shade700,
  fontWeight: FontWeight.bold,
  fontFamily: 'BungeeShade',
);

TextStyle _madeWithStyle = TextStyle(
  fontSize: 12.0,
  color: Colors.indigo,
  fontWeight: FontWeight.w400,
);
