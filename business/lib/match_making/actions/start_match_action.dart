import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match_making/actions/player_one/create_match_action.dart';
import 'package:business/match_making/actions/player_two/put_player_on_matchmaking_action.dart';
import 'package:business/player/actions/set_player_number_action.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:firebase_database/firebase_database.dart';

import 'delete_old_match_action.dart';

/// This Action can be separated in the following steps:
/// 1 - Check if there is any player on the Matchmaking database
///
/// 2a - If yes, set this player as playerOne
/// 3a - CreateMatch Action that get the player from MatchMaking on Firebase RTDB and create a match
/// 4a - Later it goes to MatchMakingWidget and do some 'handshaking', exchanging data to then go to Match.
///
/// 2b - If no, set this player as playerTwo
/// 3b - Call PutPlayerOnMatchmakingAction() that put this player ID on MatchMaking (Firebase RTDB)
/// 4b - Start playerTwo handshaking stream that query to know if a match was created with this player ID on the
///      playerTwo field.
/// 5b - And then goes to MatchMakingWidget screen

class StartMatchAction extends AppBaseAction {
  @override
  Future<AppState> reduce() async {
    final fbDatabase = getIt<FirebaseDatabase>();

    await fbDatabase.reference().child('matchmaking').once().then((DataSnapshot snapshot) async {
      //
      if (snapshot.value == null) {
        //PlayerTwo (first to click start)
        print('################# THIS PLAYER IS PLAYER TWO #######################');
        dispatch(SetPlayerNumberAction.setAsPlayerTwo());

        await dispatchFuture(DeleteOldMatchAction());

        dispatch(PutPlayerOnMatchmakingAction());
      }
      //
      else {
        //PlayerOne (Who creates the match and is first to play)
        print('snapshot is: ${snapshot.value}');
        print('################# THIS PLAYER IS PLAYER ONE #######################');
        var matchData = snapshot.value;

        dispatch(SetPlayerNumberAction.setAsPlayerOne());

        dispatch(CreateMatchAction(playerTwoId: matchData['playerID']));

        fbDatabase.reference().child('matchmaking/playerID').remove();
      }
    });
    return null;
  }
}
