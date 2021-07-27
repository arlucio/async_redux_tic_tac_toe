import 'dart:async';

import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match/actions/update_match_score_action.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ManageScoreStreamsAction extends AppBaseAction {
  final DocumentSnapshot matchDoc;
  final String homePlayerId;

  static Stream<QuerySnapshot> homePlayerStream;
  static Stream<QuerySnapshot> visitingPlayerStream;
  static StreamSubscription<QuerySnapshot> homePlayerStreamSub;
  static StreamSubscription<QuerySnapshot> visitingPlayerStreamSub;

  bool _startStream;
  bool _endStream;

  ManageScoreStreamsAction.startStream(
      {@required this.matchDoc, @required this.homePlayerId})
      : assert((matchDoc != null) && (homePlayerId != null)) {
    _startStream = true;

    homePlayerStream = getIt
        .get<FirebaseFirestore>()
        .collection('matches')
        .doc(matchDoc.id)
        .collection('winners')
        .where('playerID',
            isEqualTo: (homePlayerId == matchDoc['playerOneId'])
                ? matchDoc['playerOneId']
                : matchDoc['playerTwoId'])
        .snapshots();

    visitingPlayerStream = getIt
        .get<FirebaseFirestore>()
        .collection('matches')
        .doc(matchDoc.id)
        .collection('winners')
        .where('playerID',
            isEqualTo: (homePlayerId == matchDoc['playerOneId'])
                ? matchDoc['playerTwoId']
                : matchDoc['playerOneId'])
        .snapshots();
  }

  ManageScoreStreamsAction.endStream({this.matchDoc, this.homePlayerId}) {
    _endStream = true;
  }

  @override
  AppState reduce() {
    if (_startStream == true) {
      homePlayerStreamSub = homePlayerStream.listen((QuerySnapshot qs) {
        if (qs.docs.isNotEmpty) {
          if (qs.docs.first != null) {
            var scoreHomePlayer = qs.docs.length;
            dispatch(UpdateMatchScoreAction(scoreHomePlayer: scoreHomePlayer));
          }
        }
      });
      visitingPlayerStreamSub = visitingPlayerStream.listen((QuerySnapshot qs) {
        if (qs.docs.isNotEmpty) {
          if (qs.docs.first != null) {
            var scoreVisitingPlayer = qs.docs.length;
            dispatch(UpdateMatchScoreAction(
                scoreVisitingPlayer: scoreVisitingPlayer));
          }
        }
      });
    } else if (_endStream == true) {
      homePlayerStreamSub.cancel();
      visitingPlayerStreamSub.cancel();
    }
    return null;
  }
}
