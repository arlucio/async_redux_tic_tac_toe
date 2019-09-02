import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:flutter/material.dart';

class ChangeMatchHashStateAction extends AppBaseAction {
  final int playPosition;
  final String playType;
  final String playerTurn;

  ChangeMatchHashStateAction({@required this.playPosition, @required this.playType, @required this.playerTurn})
      : assert((playPosition != null) && (playType != null) && (playerTurn != null));

  @override
  AppState reduce() {
    return state.rebuild((b) => b
      ..matchState.update(
        (b) => b
          ..hashState[playPosition] = playType
          ..playerTurn = playerTurn,
      ));
  }
}
