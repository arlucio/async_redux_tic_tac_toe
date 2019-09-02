import 'package:align_positioned/align_positioned.dart';
import 'package:built_collection/built_collection.dart';
import 'package:client/animations/circle_animation.dart';
import 'package:client/animations/cross_animation.dart';
import 'package:flutter/material.dart';

Card gameCard({BuiltList<String> hashState, int index}) {
  return Card(
      color: (hashState[index] == 'none') ? Colors.blue.shade50 : Colors.lime.shade50,
      elevation: 5.0,
      child: AlignPositioned(
        childHeightRatio: 0.4,
        childWidthRatio: 0.4,
        alignment: Alignment.center,
        child: hashCard(lastPlayNumber: index, lastPlayType: hashState[index]),
      ));
}

/// Changes what is showing on the card
///
Widget hashCard({int lastPlayNumber, String lastPlayType}) {
  switch (lastPlayType) {
    case ('cross'):
      return CircleAnimation();
      break;
    case ('circle'):
      return CrossAnimation();
      break;
  }
  return AlignPositioned(
    alignment: Alignment.center,
    maxChildHeight: 90.0,
    minChildHeight: 60.0,
    child: FlutterLogo(
      size: 60.0,
      style: FlutterLogoStyle.markOnly,
    ),
  );
}
