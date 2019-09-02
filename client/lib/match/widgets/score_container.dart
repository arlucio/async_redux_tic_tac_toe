import 'package:flutter/material.dart';

Container scoreContainer(
    {int scoreHomePlayer, int scoreVisitingPlayer, String nameHomePlayer, String nameVisitingPlayer}) {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
          width: 80.0,
          child: Text(
            '$nameHomePlayer',
            style: _nameStyle,
            textAlign: TextAlign.center,
          )),
      SizedBox(
        width: 15.0,
      ),
      pointsContainer(scoreHomePlayer, scoreVisitingPlayer),
      SizedBox(
        width: 15.0,
      ),
      Container(
          width: 80.0,
          child: Text(
            '$nameVisitingPlayer',
            style: _nameStyle,
            textAlign: TextAlign.center,
          )),
    ],
  ));
}

Container pointsContainer(int scoreHomePlayer, int scoreVisitingPlayer) {
  return Container(
    height: 30.0,
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: 80.0,
          height: 60.0,
          decoration: _scoreBoxDecoration,
          child: Text(
            '$scoreHomePlayer x $scoreVisitingPlayer',
            style: _scoreStyle,
          ),
        )
      ],
    ),
  );
}

final _nameStyle = TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold);
final _scoreStyle = TextStyle(fontSize: 20.0, color: Colors.red.shade800, fontWeight: FontWeight.bold);
final _scoreBoxDecoration = BoxDecoration(
  color: Colors.yellow.shade50,
  shape: BoxShape.rectangle,
  borderRadius: BorderRadius.circular(50.0),
  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20.0, offset: Offset(0.0, 20.0))],
);
