import 'dart:async';

import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Every player can be added to HighScores only once and that value is updated with higher scores
/// The High Scores are just an example, doesn't make a lot of sense.
/// Victories give you 1000 points, defeats give you -500 points
/// Negative numbers are 0 on Firestore

class AddResultToHighScoresAction extends AppBaseAction {
  @override
  Future<AppState> reduce() async {
    var points = matchState.scoreHomePlayer * 1000 -
        matchState.scoreVisitingPlayer * 500;

    getIt<FirebaseFirestore>()
        .collection('highScores')
        .where("playerID", isEqualTo: homePlayer.id)
        .get()
        .then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        if (snapshot.docs.first != null) {
          if (snapshot.docs.first.data()['score'] < points) {
            getIt<FirebaseFirestore>()
                .collection('highScores')
                .doc(snapshot.docs.first.id)
                .update({
              'playerID': homePlayer.id,
              'playerName': homePlayer.name,
              'score': points,
            });
          }
        }
      } else {
        getIt<FirebaseFirestore>().collection('highScores').doc().set({
          'playerID': homePlayer.id,
          'playerName': homePlayer.name,
          'score': points,
        });
      }
    });

    return null;
  }
}
