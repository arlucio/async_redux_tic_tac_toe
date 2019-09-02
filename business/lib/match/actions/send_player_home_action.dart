import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match/actions/manage_plays_stream_action.dart';
import 'package:business/match/actions/manage_score_streams_action.dart';
import 'package:business/match/actions/manage_winner_stream_action.dart';
import 'package:business/player/model/player_model.dart';

/// Close streams and send player to home screen

class SendPlayerHomeAction extends AppBaseAction {
  @override
  AppState reduce() {
    dispatch(ManagePlaysStreamAction.endStream());
    dispatch(ManageScoreStreamsAction.endStream());
    dispatch(ManageWinnerStreamAction.endStream());
    return state.rebuild((b) => b
      ..matchState.update((b) => b
        ..exitMatchPlayer = 'none'
        ..winnerPlayer = PlayerNumber.none
        ..scoreHomePlayer = 0
        ..scoreVisitingPlayer = 0
        ..hashState =
            BuiltList<String>(['none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none']).toBuilder()));
  }

  void before() => dispatch(NavigateAction<AppState>.popUntil('matchRoute'));
  void after() => dispatch(NavigateAction<AppState>.pushReplacementNamed("/"));
}
