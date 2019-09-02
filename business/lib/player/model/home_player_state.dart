import 'package:built_value/built_value.dart';
import 'package:business/player/model/player_model.dart';
import 'package:firebase_core/firebase_core.dart';

part 'home_player_state.g.dart';

abstract class HomePlayerState implements Built<HomePlayerState, HomePlayerStateBuilder> {
  Player get player;

  factory HomePlayerState.initialState(FirebaseApp firebaseApp, String playerID) =>
      HomePlayerState((b) => b..player = Player.initialState(playerID).toBuilder());

  factory HomePlayerState([updates(HomePlayerStateBuilder b)]) = _$HomePlayerState;
  HomePlayerState._();
}
