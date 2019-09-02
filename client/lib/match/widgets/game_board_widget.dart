import 'package:built_collection/built_collection.dart';
import 'package:client/match/widgets/game_card.dart';
import 'package:client/match/widgets/not_your_turn_dialog.dart';
import 'package:client/match/widgets/space_already_occuped_dialog.dart';
import 'package:flutter/material.dart';

/// Generates the grid with the cards

Widget gameBoardWidget(
    {BuildContext context,
    BuiltList<String> hashState,
    String playerTurn,
    String homePlayerID,
    String visitingPlayerName,
    ValueChanged<int> makePlayAction}) {
  return Container(
      height: 500.0,
      child: GridView.builder(
          padding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
          ),
          itemBuilder: (context, index) => GestureDetector(
              child: gameCard(hashState: hashState, index: index),

              // If it's the player turn, check hash and make play, otherwise show dialog that's not your turn yet
              onTap: () => (playerTurn == homePlayerID)
                  ? checkHashState(context: context, index: index, hashState: hashState, makePlayAction: makePlayAction)
                  : notYourTurnDialog(context, visitingPlayerName))));
}

/// Helper function to check if the space is already occupied

void checkHashState({
  BuildContext context,
  int index,
  BuiltList<String> hashState,
  ValueChanged<int> makePlayAction,
}) {
  if (hashState[index] == 'none') {
    makePlayAction(index);
  } else {
    spaceAlreadyOccupiedDialog(context);
  }
}
