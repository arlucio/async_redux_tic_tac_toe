import 'dart:async';

import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/player/model/player_model.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class GetPlayerOneFromFirestore extends AppBaseAction {
  String matchID;

  GetPlayerOneFromFirestore({@required this.matchID}) : assert(matchID != null);

  @override
  Future<AppState> reduce() async {
    var rebuiltState = await getIt
        .get<FirebaseFirestore>()
        .collection('matches')
        .doc(matchID)
        .get()
        .then((snapshot) => state.rebuild((b) => b
          ..matchState.update((b) => b
            ..visitingPlayer.id = snapshot.data()['playerOneId']
            ..visitingPlayer.name = snapshot.data()['playerOneName']
            ..visitingPlayer.number = PlayerNumber.one)));
    return rebuiltState;
  }
}
