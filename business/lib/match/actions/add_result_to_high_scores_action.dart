import 'dart:async';

import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/services/get_it_instance.dart';

/// Every player can be added to HighScores only once and that value is updated with higher scores
/// The High Scores are just an example, doesn't make a lot of sense.
/// Victories give you 1000 points, defeats give you -500 points
/// Negative numbers are 0 on Firestore

class AddResultToHighScoresAction extends AppBaseAction {
  @override
  Future<AppState> reduce() async {
    var points = matchState.scoreHomePlayer * 1000 - matchState.scoreVisitingPlayer * 500;

    firestore.collection('highScores').where("playerID", isEqualTo: homePlayer.id).getDocuments().then((snapshot) {
      if (snapshot.documents.isNotEmpty) {
        if (snapshot.documents.first != null) {
          if (snapshot.documents.first.data['score'] < points) {
            firestore.collection('highScores').document(snapshot.documents.first.documentID).updateData({
              'playerID': homePlayer.id,
              'playerName': homePlayer.name,
              'score': points,
            });
          }
        }
      } else {
        firestore.collection('highScores').document().setData({
          'playerID': homePlayer.id,
          'playerName': homePlayer.name,
          'score': points,
        });
      }
    });

    return null;
  }
}
