import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match/actions/manage_plays_stream_action.dart';
import 'package:business/match/actions/manage_winner_stream_action.dart';
import 'package:business/player/model/player_model.dart';

import 'manage_score_streams_action.dart';

class PlayerLeftMatchAction extends AppBaseAction {
  final String exitMatchPlayer;

  PlayerLeftMatchAction({this.exitMatchPlayer}) : assert(exitMatchPlayer != null);

  @override
  AppState reduce() {
    dispatch(ManagePlaysStreamAction.endStream());
    dispatch(ManageScoreStreamsAction.endStream());
    dispatch(ManageWinnerStreamAction.endStream());

    return state.rebuild(
      (b) => b
        ..matchState.update((b) => b
          ..winnerPlayer = PlayerNumber.none
          ..exitMatchPlayer = exitMatchPlayer
          ..winnerPlayer = PlayerNumber.none
          ..scoreHomePlayer = 0
          ..scoreVisitingPlayer = 0),
    );
  }
}
