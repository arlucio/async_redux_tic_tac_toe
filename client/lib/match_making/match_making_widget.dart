import 'package:align_positioned/align_positioned.dart';
import 'package:client/match_making/widgets/exit_button.dart';

/// This widget shows up when you are on the matchmaking database and there is still no one else in it.
/// Also shows while the players are doing 'handshaking', that in this case is just exchanging the player names,
/// but could be a lot of info.
///
/// This could have been done in one less step (no need to second player to come here) just also putting first player
/// name on RTDB but this way is a nicer and more complete example for a real complex pré-match handshaking case
///
///  After this step both players have exchanged their name and id and have the matchID.
///
/// ToDO: Recheck this

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MatchMakingWidget extends StatelessWidget {
  final VoidCallback onExit;

  MatchMakingWidget({
    Key key,
    this.onExit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: <Widget>[
            AlignPositioned(
              moveByContainerHeight: 0.2,
              alignment: Alignment.topCenter,
              child: Text('Waiting for other player...', style: Theme.of(context).textTheme.title),
            ),
            AlignPositioned(
              alignment: Alignment.center,
              child: SpinKitWave(size: 50.0, color: Colors.indigo.shade700),
            ),
            AlignPositioned(
              alignment: Alignment.bottomCenter,
              dy: -MediaQuery.of(context).size.height / 10,
              child: exitButton(onExit),
            ),
          ])),
    );
  }
}
