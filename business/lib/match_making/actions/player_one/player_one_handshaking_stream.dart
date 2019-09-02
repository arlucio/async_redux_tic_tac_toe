import 'dart:async';

import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match_making/actions/player_one/finish_handshaking_one_and_go_to_match.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class PlayerOneHandshakingStream extends AppBaseAction {
  final String matchID;
  static Stream<DocumentSnapshot> matchDataStream;
  static StreamSubscription<DocumentSnapshot> matchDataStreamSub;

  bool _startStream;
  bool _endStream;

  PlayerOneHandshakingStream.startStream({@required this.matchID}) {
    _startStream = true;
    matchDataStream = firestore.collection('matches').document(matchID).snapshots();
  }

  PlayerOneHandshakingStream.endStream({this.matchID}) {
    _endStream = true;
  }

  @override
  AppState reduce() {
    if (_startStream == true) {
      matchDataStreamSub = matchDataStream.listen((DocumentSnapshot matchDoc) {
        if (matchDoc.data != null) {
          if (matchDoc.data.isNotEmpty) {
            if (matchDoc.data.containsKey('playerTwoName')) {
              dispatch(FinishHandshakingOneAndGoToMatchAction(matchDoc: matchDoc));
              matchDataStreamSub.cancel();
            }
          }
        }
      });
    } else if (_endStream == true) {
      matchDataStreamSub.cancel();
    }
    return null;
  }
}
