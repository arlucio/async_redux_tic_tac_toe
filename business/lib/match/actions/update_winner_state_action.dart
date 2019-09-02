import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/player/model/player_model.dart';

class UpdateWinnerStateAction extends AppBaseAction {
  final PlayerNumber winnerPlayer;

  UpdateWinnerStateAction({this.winnerPlayer}) : assert(winnerPlayer != null);

  @override
  AppState reduce() {
    return state.rebuild(
      (b) => b..matchState.update((b) => b..winnerPlayer = winnerPlayer),
    );
  }
}
