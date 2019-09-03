import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match_making/actions/player_one/player_one_handshaking_stream.dart';
import 'package:business/player/model/player_model.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:flutter/material.dart';

class CreateMatchAction extends AppBaseAction {
  final String playerTwoId;

  CreateMatchAction({@required this.playerTwoId}) : assert(playerTwoId != null);

  @override
  Future<AppState> reduce() async {
    var matchRef = firestore.collection('matches').document();
    await matchRef.setData({
      'playerOneId': homePlayer.id,
      'playerTwoId': playerTwoId,
      'playerOneName': homePlayer.name,
      'playerTurn': homePlayer.id,
    });

    dispatch(PlayerOneHandshakingStream.startStream(matchID: matchRef.documentID));

    return state.rebuild((b) => b
      ..matchState.update((b) => b
        ..hashState = BuiltList<String>(
            ['none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none']).toBuilder()
        ..visitingPlayer.id = playerTwoId
        ..visitingPlayer.number = PlayerNumber.two
        ..matchID = matchRef.documentID
        ..playerTurn = homePlayer.id));
  }

  void after() => dispatch(NavigateAction<AppState>.pushReplacementNamed("matchMakingRoute"));
}
