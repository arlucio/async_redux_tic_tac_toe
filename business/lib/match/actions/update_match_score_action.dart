import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';

class UpdateMatchScoreAction extends AppBaseAction {
  final int scoreHomePlayer;
  final int scoreVisitingPlayer;

  UpdateMatchScoreAction({this.scoreHomePlayer, this.scoreVisitingPlayer})
      : assert((scoreHomePlayer != null) && (scoreVisitingPlayer == null) ||
            (scoreHomePlayer == null) && (scoreVisitingPlayer != null));

  @override
  AppState reduce() {
    if (scoreHomePlayer != null) {
      return state.rebuild(
        (b) => b..matchState.update((b) => b..scoreHomePlayer = scoreHomePlayer),
      );
    }
    return state.rebuild(
      (b) => b..matchState.update((b) => b..scoreVisitingPlayer = scoreVisitingPlayer),
    );
  }
}
