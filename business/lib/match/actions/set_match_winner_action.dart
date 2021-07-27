import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/player/model/player_model.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// The 'winners' collection on database keeps the data of all winners of the match to generate the scores
/// The 'lastWinner' collection is just used to fire the victory/draw dialog and is erased on match restart

class SetMatchWinnerAction extends AppBaseAction {
  final PlayerNumber winnerPlayer;

  SetMatchWinnerAction({@required this.winnerPlayer})
      : assert(winnerPlayer != null);

  @override
  Future<AppState> reduce() async {
    if (winnerPlayer == PlayerNumber.none) {
      await getIt
          .get<FirebaseFirestore>()
          .collection('matches')
          .doc(matchState.matchID)
          .collection('lastWinner')
          .add({'playerID': 'DRAW'});

      await getIt
          .get<FirebaseFirestore>()
          .collection('matches')
          .doc(matchState.matchID)
          .collection('winners')
          .add({'playerID': 'DRAW'});
    } else {
      await getIt
          .get<FirebaseFirestore>()
          .collection('matches')
          .doc(matchState.matchID)
          .collection('lastWinner')
          .add({
        'playerID': (winnerPlayer == homePlayer.number)
            ? homePlayer.id
            : visitingPlayer.id
      });

      await getIt
          .get<FirebaseFirestore>()
          .collection('matches')
          .doc(matchState.matchID)
          .collection('winners')
          .add({
        'playerID': (winnerPlayer == homePlayer.number)
            ? homePlayer.id
            : visitingPlayer.id
      });
    }
    return null;
  }
}
