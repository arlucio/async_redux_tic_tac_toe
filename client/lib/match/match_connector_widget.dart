import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match/actions/exit_match_action.dart';
import 'package:business/match/actions/make_play_action.dart';
import 'package:business/match/actions/restart_match_action.dart';
import 'package:business/match/actions/send_player_home_action.dart';
import 'package:business/player/model/player_model.dart';
import 'package:client/match/match_widget.dart';
import 'package:flutter/material.dart';

String matchRoute = "matchRoute";

class MatchConnector extends StatelessWidget {
  MatchConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MatchViewModel>(
      model: MatchViewModel(),
      builder: (context, viewModel) => MatchWidget(
        scoreHomePlayer: viewModel.scoreHomePlayer,
        scoreVisitingPlayer: viewModel.scoreVisitingPlayer,
        exitMatchPlayer: viewModel.exitMatchPlayer,
        matchID: viewModel.matchID,
        playerTurn: viewModel.playerTurn,
        winnerPlayer: viewModel.winnerPlayer,
        homePlayer: viewModel.homePlayer,
        visitingPlayer: viewModel.visitingPlayer,
        hashState: viewModel.hashState,
        onNewMatch: viewModel.onNewMatch,
        sendPlayerHome: viewModel.sendPlayerHome,
        onExit: viewModel.onExit,
        makePlayAction: viewModel.makePlayAction,
      ),
    );
  }
}

class MatchViewModel extends BaseModel<AppState> {
  MatchViewModel();

  int scoreHomePlayer;
  int scoreVisitingPlayer;
  String exitMatchPlayer;
  String matchID;
  String playerTurn;
  PlayerNumber winnerPlayer;
  Player homePlayer;
  Player visitingPlayer;
  BuiltList<String> hashState;
  VoidCallback onNewMatch;
  VoidCallback sendPlayerHome;
  Function(bool isFirstPlayerToLeaveMatch, BuildContext context) onExit;
  ValueChanged<int> makePlayAction;

  MatchViewModel.build({
    @required this.exitMatchPlayer,
    @required this.scoreHomePlayer,
    @required this.scoreVisitingPlayer,
    @required this.matchID,
    @required this.playerTurn,
    @required this.winnerPlayer,
    @required this.homePlayer,
    @required this.visitingPlayer,
    @required this.hashState,
    @required this.makePlayAction,
    @required this.onExit,
    @required this.sendPlayerHome,
    @required this.onNewMatch,
  }) : super(equals: [
          hashState,
          playerTurn,
          exitMatchPlayer,
          scoreHomePlayer,
          scoreVisitingPlayer,
          visitingPlayer.name
        ]);

  @override
  MatchViewModel fromStore() => MatchViewModel.build(
        scoreHomePlayer: state.matchState.scoreHomePlayer,
        scoreVisitingPlayer: state.matchState.scoreVisitingPlayer,
        exitMatchPlayer: state.matchState.exitMatchPlayer,
        matchID: state.matchState.matchID,
        playerTurn: state.matchState.playerTurn,
        winnerPlayer: state.matchState.winnerPlayer,
        homePlayer: state.homePlayerState.player,
        visitingPlayer: state.matchState.visitingPlayer,
        hashState: state.matchState.hashState,
        makePlayAction: (index) => dispatch(MakePlayAction(hashIndex: index)),
        sendPlayerHome: () => dispatch(SendPlayerHomeAction()),
        onNewMatch: () => dispatch(RestartMatchAction()),
        onExit: (isFirstPlayerToLeaveMatch, context) {
          dispatch(ExitMatchAction(isFirstPlayerToLeaveMatch: isFirstPlayerToLeaveMatch, buildContext: context));
        },
      );
}
