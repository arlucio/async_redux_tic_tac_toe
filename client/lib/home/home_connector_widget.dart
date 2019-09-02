import 'package:async_redux/async_redux.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match_making/actions/start_match_action.dart';
import 'package:business/player/actions/generate_new_random_name_action.dart';
import 'package:business/player/actions/manage_change_name_action.dart';
import 'package:client/home/home_widget.dart';
import 'package:flutter/material.dart';

String homeRoute = "homeRoute";

class HomeConnector extends StatelessWidget {
  HomeConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeViewModel>(
      model: HomeViewModel(),
      builder: (context, viewModel) => HomeWidget(
        playerName: viewModel.name,
        playerId: viewModel.playerId,
        onStart: viewModel.onStart,
        generateRandomName: viewModel.generateRandomName,
        onNameChanged: viewModel.onNameChanged,
      ),
    );
  }
}

class HomeViewModel extends BaseModel<AppState> {
  HomeViewModel();

  String name;
  String playerId;
  VoidCallback onStart;
  VoidCallback generateRandomName;
  ValueChanged<String> onNameChanged;

  HomeViewModel.build({
    @required this.name,
    @required this.playerId,
    @required this.onStart,
    @required this.generateRandomName,
    @required this.onNameChanged,
  }) : super(equals: [playerId, name]);

  @override
  HomeViewModel fromStore() => HomeViewModel.build(
        name: state.homePlayerState.player.name,
        playerId: state.homePlayerState.player.id,
        onStart: () => dispatch(StartMatchAction()),
        generateRandomName: () => dispatch(GenerateNewRandomNameAction()),
        onNameChanged: (name) => dispatch(ChangeNameWithDebounceAction(name: name)),
      );
}
