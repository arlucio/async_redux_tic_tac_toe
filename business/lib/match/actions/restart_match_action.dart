import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/player/model/player_model.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// 1 - Delete 'lastWinner' as it is only used to generate the victory dialog
/// 2 - Delete lastPlay so the new match don't start with a play and set playerTurn the player who will play first next game
/// 3 - Erase everything on hashState to generate a new match

class RestartMatchAction extends AppBaseAction {
  @override
  Future<AppState> reduce() async {
    await getIt
        .get<FirebaseFirestore>()
        .collection('matches')
        .doc(matchState.matchID)
        .collection('lastWinner')
        .get()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });

    await getIt
        .get<FirebaseFirestore>()
        .collection('matches')
        .doc(state.matchState.matchID)
        .update({
      'lastPlay': FieldValue.delete(),
      'playerTurn': (homePlayer.number == PlayerNumber.two)
          ? homePlayer.id
          : visitingPlayer.id,
    });

    return state.rebuild((b) => b
      ..matchState.update((b) => b
        ..winnerPlayer = PlayerNumber.none
        ..hashState = BuiltList<String>([
          'none',
          'none',
          'none',
          'none',
          'none',
          'none',
          'none',
          'none',
          'none'
        ]).toBuilder()));
  }

  void before() => dispatch(NavigateAction<AppState>.pop());
}
