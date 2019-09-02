import 'dart:async';

import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match_making/actions/player_two/finish_handshaking_two_and_go_to_match_action.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

/// 1 - Create a query to find a doc with this player ID on the playerTwoId field.
/// 2 - When other player creates a game with this player id, data from the match is streamed back here.
/// 3 - Using the just received matchID (received doc documentID) we update it with this player name.
/// 4 - Set the playerOne data and the match data.
/// 5 - Handshaking on this side is over, finish handshaking stream, start match streams and go to match screen.

class PlayerTwoHandshakingStream extends AppBaseAction {
  final String playerID;

  static Stream<QuerySnapshot> playerTwoNameStream;
  static StreamSubscription<QuerySnapshot> playerTwoNameStreamSub;

  bool _startStream;
  bool _endStream;

  PlayerTwoHandshakingStream.startStream({@required this.playerID}) {
    _startStream = true;
    playerTwoNameStream =
        getIt.get<Firestore>().collection('matches').where("playerTwoId", isEqualTo: playerID).snapshots();
  }

  PlayerTwoHandshakingStream.endStream({this.playerID}) {
    _endStream = true;
  }

  @override
  AppState reduce() {
    if (_startStream == true) {
      playerTwoNameStreamSub = playerTwoNameStream.listen((QuerySnapshot qs) {
        if (qs.documents.isNotEmpty) {
          if (qs.documents.first != null) {
            if (qs.documents.first.data.isNotEmpty) {
              if (qs.documents.first.data.containsKey('playerOneId')) {
                var matchDoc = qs.documents.first;
                dispatch(FinishHandshakingTwoAndGoToMatchAction(matchDoc: matchDoc)); // Set playerTwoName on firestore
              }
            }
          }
        }
      });
    } else if (_endStream == true) {
      playerTwoNameStreamSub.cancel();
    }

    return null;
  }
}
