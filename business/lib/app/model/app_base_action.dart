import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match/model/match_state.dart';
import 'package:business/player/model/player_model.dart';

abstract class AppBaseAction extends ReduxAction<AppState> {
  MatchState get matchState => state.matchState;
  Player get homePlayer => state.homePlayerState.player;
  Player get visitingPlayer => state.matchState.visitingPlayer;
  BuiltList<String> get hPos => state.matchState.hashState;
}
