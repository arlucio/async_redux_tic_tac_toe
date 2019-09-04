import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match/actions/manage_plays_stream_action.dart';
import 'package:business/match/actions/manage_score_streams_action.dart';
import 'package:business/match/actions/manage_winner_stream_action.dart';
import 'package:business/match_making/actions/player_two/get_player_one_from_firestore.dart';
import 'package:business/match_making/actions/player_two/player_two_handshaking_stream.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

/// 0 - Get PlayerOne Data from Firestore using the received matchID
/// 1 - Set PlayerTwo on Firestore using the received matchID
/// 2 - Finish Handshaking Stream and start all Match Streams
/// 3 - Go to Match screen

class FinishHandshakingTwoAndGoToMatchAction extends AppBaseAction {
  DocumentSnapshot matchDoc;

  FinishHandshakingTwoAndGoToMatchAction({@required this.matchDoc}) : assert(matchDoc != null);

  @override
  Future<AppState> reduce() async {
    var matchID = matchDoc.documentID;

    // Set playerTwoName on Firestore
    await firestore
        .collection('matches')
        .document(matchID)
        .updateData({'playerTwoName': homePlayer.name});

    dispatch(PlayerTwoHandshakingStream.endStream());

    dispatch(ManageScoreStreamsAction.startStream(matchDoc: matchDoc, homePlayerId: homePlayer.id));

    dispatch(ManagePlaysStreamAction.startStream(matchID: matchID));

    dispatch(ManageWinnerStreamAction.startStream(matchID: matchID));

    return state.rebuild((b) => b
      ..matchState.update((b) => b
        ..matchID = matchID
        ..hashState = BuiltList<String>(
            ['none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none']).toBuilder()));
  }

  void before() => dispatch(GetPlayerOneFromFirestore(matchID: matchDoc.documentID));

  void after() => dispatch(NavigateAction<AppState>.pushReplacementNamed("matchRoute"));
}
