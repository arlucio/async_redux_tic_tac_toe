import 'dart:async';

import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Check if already exists any match with the player and delete all the matches documents and also the sub-collections

class LookForMatchWithPlayerAndDeleteAction extends AppBaseAction {
  @override
  Future<AppState> reduce() async {
    firestore.collection('matches').where("playerOneId", isEqualTo: homePlayer.id).getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents) {
        ds.reference.collection('lastWinner').getDocuments().then((snapshot) {
          for (DocumentSnapshot ds in snapshot.documents) {
            ds.reference.delete();
          }

          ds.reference.collection('winners').getDocuments().then((snapshot) {
            for (DocumentSnapshot ds in snapshot.documents) {
              ds.reference.delete();
            }
          });
        });

        ds.reference.delete();
      }
    });
    firestore.collection('matches').where("playerTwoId", isEqualTo: homePlayer.id).getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents) {
        ds.reference.delete();
      }
    });

    return null;
  }
}
