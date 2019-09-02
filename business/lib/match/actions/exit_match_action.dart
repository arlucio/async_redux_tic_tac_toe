import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match/actions/add_result_to_high_scores_action.dart';
import 'package:business/match/actions/manage_plays_stream_action.dart';
import 'package:business/match/actions/manage_score_streams_action.dart';
import 'package:business/match/actions/manage_winner_stream_action.dart';
import 'package:business/player/model/player_model.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

/// Erase everything from the Match and send player to start screen
/// Obs: Is necessary to do 3 calls here because when I delete the root collection it doesn't delete the leafs collections

class ExitMatchAction extends AppBaseAction {
  final bool isFirstPlayerToLeaveMatch;
  final BuildContext buildContext;

  ExitMatchAction({this.isFirstPlayerToLeaveMatch, @required this.buildContext})
      : assert((isFirstPlayerToLeaveMatch != null) && (buildContext != null));

  @override
  Future<AppState> reduce() async {
    String routeName = NavigateAction.getCurrentNavigatorRouteName(buildContext);
    if (routeName == null) {
      // this means a dialog is open
      dispatch(NavigateAction<AppState>.popUntil('matchRoute'));
    }

    if (isFirstPlayerToLeaveMatch == true) {
      dispatch(ManagePlaysStreamAction.endStream());
      dispatch(ManageScoreStreamsAction.endStream());
      dispatch(ManageWinnerStreamAction.endStream());

      await firestore.collection('matches').document(matchState.matchID).updateData({
        'exitMatchPlayer': homePlayer.id,
      });
      await firestore
          .collection('matches')
          .document(matchState.matchID)
          .collection('lastWinner')
          .getDocuments()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.documents) {
          ds.reference.delete();
        }
      });

      await firestore
          .collection('matches')
          .document(matchState.matchID)
          .collection('winners')
          .getDocuments()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.documents) {
          ds.reference.delete();
        }
      });

      await firestore.collection('matches').document(matchState.matchID).delete();
    } else {
      await firestore.collection('matches').document(matchState.matchID).delete();
    }

    return state.rebuild((b) => b
      ..matchState.update((b) => b
        ..exitMatchPlayer = 'none'
        ..winnerPlayer = PlayerNumber.none
        ..visitingPlayer.id = ''
        ..visitingPlayer.number = PlayerNumber.none
        ..matchID = ''
        ..playerTurn = ''
        ..scoreHomePlayer = 0
        ..scoreVisitingPlayer = 0
        ..hashState =
            BuiltList<String>(['none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none']).toBuilder()));
  }

  void before() => dispatch(AddResultToHighScoresAction());
  void after() => dispatch(NavigateAction<AppState>.pushReplacementNamed("/"));
}
