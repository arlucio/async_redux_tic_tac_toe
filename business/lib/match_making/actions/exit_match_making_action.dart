import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match_making/actions/player_one/player_one_handshaking_stream.dart';
import 'package:business/match_making/actions/player_two/player_two_handshaking_stream.dart';
import 'package:business/player/model/player_model.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:firebase_database/firebase_database.dart';

/// 1 - Delete playerID document on Firebase RTDB
/// 3 - Send player back to start screen

class ExitMatchMakingAction extends AppBaseAction {
  @override
  Future<AppState> reduce() async {
    final fbDatabase = getIt<FirebaseDatabase>();
    await fbDatabase.reference().child('matchmaking/playerID').remove();

    if (homePlayer.number == PlayerNumber.one) {
      PlayerOneHandshakingStream.endStream();
    } else {
      PlayerTwoHandshakingStream.endStream();
    }

    return state.rebuild(
      (b) => b
        ..homePlayerState.update(
          (b) => b..player.number = PlayerNumber.none,
        ),
    );
  }

  void after() => dispatch(NavigateAction<AppState>.pushReplacementNamed("/"));
}
