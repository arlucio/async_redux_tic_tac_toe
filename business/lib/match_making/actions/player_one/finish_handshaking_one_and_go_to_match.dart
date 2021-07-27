import 'package:async_redux/async_redux.dart';
import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match/actions/manage_plays_stream_action.dart';
import 'package:business/match/actions/manage_score_streams_action.dart';
import 'package:business/match/actions/manage_winner_stream_action.dart';
import 'package:business/match_making/actions/player_one/player_one_handshaking_stream.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

/// 1 - Set visitingPlayer from received playerTwo data
/// 3 - Go to Match screen

class FinishHandshakingOneAndGoToMatchAction extends AppBaseAction {
  DocumentSnapshot matchDoc;

  FinishHandshakingOneAndGoToMatchAction({@required this.matchDoc})
      : assert(matchDoc != null);

  @override
  Future<AppState> reduce() async {
    var matchID = matchDoc.id;
    var matchData = matchDoc.data();
    var playerTwoName = matchData['playerTwoName'];

    var rebuiltState = state.rebuild((b) => b
      ..matchState.update((b) => b
        ..visitingPlayer.name = playerTwoName
        ..matchID = matchID));
    await Future.delayed(Duration(milliseconds: 500),
        () {}); // just a small delay to avoid errors

    dispatch(PlayerOneHandshakingStream.endStream());
    dispatch(ManageScoreStreamsAction.startStream(
        matchDoc: matchDoc, homePlayerId: homePlayer.id));
    dispatch(ManagePlaysStreamAction.startStream(matchID: matchID));
    dispatch(ManageWinnerStreamAction.startStream(matchID: matchID));

    return rebuiltState;
  }

  void after() =>
      dispatch(NavigateAction<AppState>.pushReplacementNamed("matchRoute"));
}
