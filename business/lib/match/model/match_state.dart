import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:business/player/model/player_model.dart';

part 'match_state.g.dart';

abstract class MatchState implements Built<MatchState, MatchStateBuilder> {
  String get exitMatchPlayer;
  int get scoreHomePlayer;
  int get scoreVisitingPlayer;
  @nullable
  String get matchID;
  String get playerTurn;
  PlayerNumber get winnerPlayer;
  Player get visitingPlayer;
  BuiltList<String> get hashState;

  factory MatchState.initialState({String playerID}) => MatchState((b) => b
    ..exitMatchPlayer = 'none'
    ..scoreHomePlayer = 0
    ..scoreVisitingPlayer = 0
    ..matchID = ''
    ..playerTurn = ''
    ..winnerPlayer = PlayerNumber.none
    ..visitingPlayer = Player.initialState(playerID).toBuilder()
    ..hashState =
        BuiltList<String>(['none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none']).toBuilder());

  factory MatchState([updates(MatchStateBuilder b)]) = _$MatchState;

  MatchState._();
}
