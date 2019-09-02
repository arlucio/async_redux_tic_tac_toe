import 'dart:async';

import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match/actions/update_winner_state_action.dart';
import 'package:business/player/model/player_model.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ManageWinnerStreamAction extends AppBaseAction {
  String matchID;

  static Stream<QuerySnapshot> winnersStream;
  static StreamSubscription<QuerySnapshot> winnersStreamSub;

  bool _startStream;
  bool _endStream;

  ManageWinnerStreamAction.startStream({@required this.matchID}) {
    _startStream = true;
    winnersStream = getIt.get<Firestore>().collection('matches').document(matchID).collection('lastWinner').snapshots();
  }

  ManageWinnerStreamAction.endStream() {
    _endStream = true;
  }

  @override
  AppState reduce() {
    if (_startStream == true) {
      winnersStreamSub = winnersStream.listen((QuerySnapshot qs) {
        if (qs.documents != null) {
          if (qs.documents.isNotEmpty) {
            var winnerData = qs.documents.first;
            PlayerNumber winnerPlayer;
            if (winnerData['playerID'] == 'DRAW') {
              winnerPlayer = PlayerNumber.neither;
            } else {
              winnerPlayer =
                  (winnerData['playerID'] == homePlayer.id.toString()) ? homePlayer.number : visitingPlayer.number;
              dispatch(UpdateWinnerStateAction(winnerPlayer: winnerPlayer));
            }
          }
        }
      });
    } else if (_endStream == true) {
      winnersStreamSub.cancel();
    }
    return null;
  }
}
