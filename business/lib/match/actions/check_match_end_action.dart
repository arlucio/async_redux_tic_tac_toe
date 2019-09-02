import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match/actions/set_match_winner_action.dart';
import 'package:business/player/model/player_model.dart';

/// Check each case of victory and set the winner name/draw case on database
/// Just to be easier to see we set hPos = hashPosition

class CheckMatchEndAction extends AppBaseAction {
  @override
  AppState reduce() {
    bool _playerOneVictory = false;
    bool _playerTwoVictory = false;

    /// Checking the horizontal lines
    if ((hPos[0]) != 'none' && (hPos[0] == hPos[1]) && (hPos[1] == hPos[2])) {
      (hPos[0] == 'cross') ? _playerOneVictory = true : _playerTwoVictory = true;
    } else if ((hPos[3]) != 'none' && (hPos[3] == hPos[4]) && (hPos[4] == hPos[5])) {
      (hPos[3] == 'cross') ? _playerOneVictory = true : _playerTwoVictory = true;
    } else if ((hPos[6]) != 'none' && (hPos[6] == hPos[7]) && (hPos[7] == hPos[8])) {
      (hPos[6] == 'cross') ? _playerOneVictory = true : _playerTwoVictory = true;
    }

    /// Checking the vertical lines
    else if ((hPos[0]) != 'none' && (hPos[0] == hPos[3]) && (hPos[3] == hPos[6])) {
      (hPos[0] == 'cross') ? _playerOneVictory = true : _playerTwoVictory = true;
    } else if ((hPos[1]) != 'none' && (hPos[1] == hPos[4]) && (hPos[4] == hPos[7])) {
      (hPos[1] == 'cross') ? _playerOneVictory = true : _playerTwoVictory = true;
    } else if ((hPos[2]) != 'none' && (hPos[2] == hPos[5]) && (hPos[5] == hPos[8])) {
      (hPos[2] == 'cross') ? _playerOneVictory = true : _playerTwoVictory = true;
    }

    /// Checking the diagonal lines
    else if ((hPos[0]) != 'none' && (hPos[0] == hPos[4]) && (hPos[4] == hPos[8])) {
      (hPos[0] == 'cross') ? _playerOneVictory = true : _playerTwoVictory = true;
    } else if ((hPos[2]) != 'none' && (hPos[2] == hPos[4]) && (hPos[4] == hPos[6])) {
      (hPos[2] == 'cross') ? _playerOneVictory = true : _playerTwoVictory = true;
    }

    /// Checking for Draw
    else if (!hPos.contains('none')) {
      dispatch(SetMatchWinnerAction(winnerPlayer: PlayerNumber.none));
    }

    if (_playerOneVictory) {
      dispatch(SetMatchWinnerAction(winnerPlayer: PlayerNumber.one));
    } else if (_playerTwoVictory) {
      dispatch(SetMatchWinnerAction(winnerPlayer: PlayerNumber.two));
    }

    return null;
  }
}
