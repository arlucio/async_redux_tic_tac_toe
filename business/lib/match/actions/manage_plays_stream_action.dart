import 'dart:async';

import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match/actions/change_match_hash_state_action.dart';
import 'package:business/match/actions/player_left_match_action.dart';
import 'package:business/match/model/match_data.dart';
import 'package:business/match/model/serializers.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ManagePlaysStreamAction extends AppBaseAction {
  String matchID;
  static Stream<DocumentSnapshot> playsStream;
  static StreamSubscription<DocumentSnapshot> playsStreamSub;

  bool _startStream;
  bool _endStream;

  ManagePlaysStreamAction.startStream({@required this.matchID}) {
    _startStream = true;
    playsStream = getIt.get<Firestore>().collection('matches').document(matchID).snapshots();
  }

  ManagePlaysStreamAction.endStream() {
    _endStream = true;
  }

  @override
  AppState reduce() {
    if (_startStream == true) {
      playsStreamSub = playsStream.listen((DocumentSnapshot matchDoc) {
        if (matchDoc.data != null) {
          if (matchDoc.data.isNotEmpty) {
            if (matchDoc.data.containsKey('exitMatchPlayer')) {
              var exitMatchPlayer = matchDoc.data['exitMatchPlayer'];
              dispatch(PlayerLeftMatchAction(exitMatchPlayer: exitMatchPlayer));
              return null;
            } else if (matchDoc.data.containsKey('lastPlay')) {
              var matchData = standardSerializers.deserializeWith(MatchData.serializer, matchDoc.data);
              dispatch(ChangeMatchHashStateAction(
                playPosition: matchData.lastPlay.playNumber,
                playType: matchData.lastPlay.playType,
                playerTurn: matchData.playerTurn,
              ));
            }
          }
        }
      });
    } else if (_endStream == true) {
      playsStreamSub.cancel();
    }

    return null;
  }
}
