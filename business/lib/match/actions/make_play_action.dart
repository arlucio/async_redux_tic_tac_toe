import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match/actions/check_match_end_action.dart';
import 'package:business/player/model/player_model.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

/// Makes a play on Firestore and pass the turn to the opponent

class MakePlayAction extends AppBaseAction {
  final int hashIndex;

  MakePlayAction({@required this.hashIndex}) : assert(hashIndex != null);

  @override
  Future<AppState> reduce() async {
    var hashField =
        (homePlayer.number == PlayerNumber.one) ? 'cross' : 'circle';

    await getIt
        .get<FirebaseFirestore>()
        .collection('matches')
        .doc(state.matchState.matchID)
        .update({
      'lastPlay': {'playType': hashField, 'playNumber': hashIndex},
      'playerTurn': matchState.visitingPlayer.id,
    });
    return null;
  }

  after() => dispatch(CheckMatchEndAction());
}
