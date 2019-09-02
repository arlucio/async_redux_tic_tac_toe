import 'package:align_positioned/align_positioned.dart';
import 'package:client/home/widgets/app_logo_container.dart';
import 'package:client/home/widgets/high_scores_button.dart';
import 'package:client/home/widgets/home_app_bar.dart';
import 'package:client/home/widgets/player_name_container.dart';
import 'package:client/home/widgets/start_button.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final String playerId;
  final String playerName;
  final VoidCallback onStart;
  final ValueChanged<String> onNameChanged;
  final VoidCallback generateRandomName;

  HomeWidget({
    this.playerName,
    this.playerId,
    this.onStart,
    this.onNameChanged,
    this.generateRandomName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.lightBlue.shade100,
        appBar: homeAppBar(context),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: <Widget>[
              AlignPositioned(
                dy: 50,
                alignment: Alignment.topCenter,
                child: appLogoContainer(),
              ),
              AlignPositioned(
                dy: 180,
                alignment: Alignment.topCenter,
                child: PlayerNameWidget(
                  playerName: playerName,
                  generateRandomName: generateRandomName,
                  onNameChanged: onNameChanged,
                ),
              ),
              AlignPositioned(
                dy: -80,
                alignment: Alignment.bottomCenter,
                child: startButton(onStart),
              ),
              AlignPositioned(
                dy: -20,
                alignment: Alignment.bottomCenter,
                child: highScoresButton(context),
              ),
            ])));
  }
}
