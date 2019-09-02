import 'package:async_redux/async_redux.dart';
import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match_making/actions/player_two/player_two_handshaking_stream.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:firebase_database/firebase_database.dart';

class PutPlayerOnMatchmakingAction extends AppBaseAction {
  @override
  Future<AppState> reduce() async {
    final fbDatabase = getIt<FirebaseDatabase>();
    await fbDatabase.reference().child('matchmaking/playerID').runTransaction((mutableData) async {
      mutableData.value = homePlayer.id;
      return mutableData;
    });
    dispatch(PlayerTwoHandshakingStream.startStream(playerID: homePlayer.id));
    return null;
  }

  void after() => dispatch(NavigateAction<AppState>.pushReplacementNamed("matchMakingRoute"));
}
