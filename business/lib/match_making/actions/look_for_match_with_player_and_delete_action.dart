import 'dart:async';

import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Check if already exists any match with the player and delete all the matches documents and also the sub-collections

class LookForMatchWithPlayerAndDeleteAction extends AppBaseAction {
  @override
  Future<AppState> reduce() async {
    getIt
        .get<FirebaseFirestore>()
        .collection('matches')
        .where("playerOneId", isEqualTo: homePlayer.id)
        .get()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.collection('lastWinner').get().then((snapshot) {
          for (DocumentSnapshot ds in snapshot.docs) {
            ds.reference.delete();
          }

          ds.reference.collection('winners').get().then((snapshot) {
            for (DocumentSnapshot ds in snapshot.docs) {
              ds.reference.delete();
            }
          });
        });

        ds.reference.delete();
      }
    });
    getIt
        .get<FirebaseFirestore>()
        .collection('matches')
        .where("playerTwoId", isEqualTo: homePlayer.id)
        .get()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });

    return null;
  }
}
