import 'package:built_value/built_value.dart';
import 'package:business/match/model/match_state.dart';
import 'package:business/player/model/home_player_state.dart';
import 'package:firebase_core/firebase_core.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  MatchState get matchState;
  HomePlayerState get homePlayerState;

  factory AppState.initialState(FirebaseApp firebaseApp, String playerID) => AppState((b) => b
    ..matchState = MatchState.initialState().toBuilder()
    ..homePlayerState = HomePlayerState.initialState(firebaseApp, playerID).toBuilder());

  factory AppState([updates(AppStateBuilder b)]) = _$AppState;
  AppState._();
}
