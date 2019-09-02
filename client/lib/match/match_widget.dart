import 'package:align_positioned/align_positioned.dart';
import 'package:built_collection/built_collection.dart';
import 'package:business/player/model/player_model.dart';
import 'package:client/match/widgets/game_board_widget.dart';
import 'package:client/match/widgets/give_up_button.dart';
import 'package:client/match/widgets/match_app_bar.dart';
import 'package:client/match/widgets/match_is_over_dialog.dart';
import 'package:client/match/widgets/opponent_left_dialog.dart';
import 'package:client/match/widgets/result_draw_dialog.dart';
import 'package:client/match/widgets/score_container.dart';
import 'package:client/match/widgets/victory_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';

/// The state of each field of the match is kept only locally for each player using matchState.hashState
/// Only the lastPlay is updated on database and catch by a Firestore query stream to update the state

class MatchWidget extends StatelessWidget {
  final int scoreHomePlayer;
  final int scoreVisitingPlayer;
  final String exitMatchPlayer;
  final String matchID;
  final String playerTurn;
  final PlayerNumber winnerPlayer;
  final Player homePlayer;
  final Player visitingPlayer;
  final BuiltList<String> hashState;
  final VoidCallback onNewMatch;
  final VoidCallback sendPlayerHome;
  final Function(bool isFirstPlayerToLeave, BuildContext context) onExit;
  final ValueChanged<int> makePlayAction;

  MatchWidget({
    Key key,
    this.scoreHomePlayer,
    this.scoreVisitingPlayer,
    this.exitMatchPlayer,
    this.matchID,
    this.playerTurn,
    this.winnerPlayer,
    this.homePlayer,
    this.visitingPlayer,
    this.hashState,
    this.onNewMatch,
    this.sendPlayerHome,
    this.onExit,
    this.makePlayAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    checkEndOfTheMatch(context); // Shows victory dialog
    checkIfPlayerLeft(context);

    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      appBar: matchAppBar,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: <Widget>[
            AlignPositioned(
              alignment: Alignment.topCenter,
              dy: 30,
              child: scoreContainer(
                  scoreHomePlayer: scoreHomePlayer,
                  scoreVisitingPlayer: scoreVisitingPlayer,
                  nameHomePlayer: homePlayer.name,
                  nameVisitingPlayer: visitingPlayer.name),
            ),
            AlignPositioned(
              alignment: Alignment.center,
              dy: 50,
              child: gameBoardWidget(
                  context: context,
                  hashState: hashState,
                  playerTurn: playerTurn,
                  homePlayerID: homePlayer.id,
                  visitingPlayerName: visitingPlayer.name,
                  makePlayAction: makePlayAction),
            ),
            AlignPositioned(
              alignment: Alignment.bottomCenter,
              dy: -30,
              child: giveUpButton(context, onExit),
            ),
          ])),
    );
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// ------------Helper Methods (Runs Every Build) ------------

  void checkEndOfTheMatch(BuildContext context) {
    /// Draw case
    if (!hashState.contains('none')) {
      WidgetsBinding.instance.addPostFrameCallback((_) => resultDrawDialog(context, onExit, onNewMatch));
    }

    /// Player victory case
    else if (winnerPlayer != PlayerNumber.none) {
      if (winnerPlayer == homePlayer.number) {
        WidgetsBinding.instance
            .addPostFrameCallback((_) => victoryDialog(context, homePlayer.id, homePlayer.id, onExit, onNewMatch));
      } else if (winnerPlayer == visitingPlayer.number) {
        WidgetsBinding.instance
            .addPostFrameCallback((_) => victoryDialog(context, visitingPlayer.id, homePlayer.id, onExit, onNewMatch));
      }
    }
  }

  void checkIfPlayerLeft(BuildContext context) {
    if (exitMatchPlayer != 'none') {
      if (exitMatchPlayer == homePlayer.id) {
        WidgetsBinding.instance.addPostFrameCallback((_) => matchIsOverDialog(context, sendPlayerHome));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => opponentLeftDialog(context, onExit));
      }
    }
  }
}
