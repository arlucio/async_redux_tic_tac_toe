import 'package:async_redux/async_redux.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/player/model/player_model.dart';

class SetPlayerNumberAction extends ReduxAction<AppState> {
  PlayerNumber playerNumber;

  SetPlayerNumberAction.setAsPlayerOne() {
    playerNumber = PlayerNumber.one;
  }

  SetPlayerNumberAction.setAsPlayerTwo() {
    playerNumber = PlayerNumber.two;
  }

  @override
  AppState reduce() {
    return state.rebuild(
      (b) => b
        ..homePlayerState.update(
          (b) => b..player.number = playerNumber,
        ),
    );
  }
}
