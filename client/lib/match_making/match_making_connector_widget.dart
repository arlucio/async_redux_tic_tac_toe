import 'package:async_redux/async_redux.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/match_making/actions/exit_match_making_action.dart';
import 'package:client/match_making/match_making_widget.dart';
import 'package:flutter/material.dart';

const String matchMakingRoute = "matchMakingRoute";

class MatchMakingConnector extends StatelessWidget {
  MatchMakingConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MatchMakingViewModel>(
      model: MatchMakingViewModel(),
      builder: (context, viewModel) => MatchMakingWidget(
        onExit: viewModel.onExit,
      ),
    );
  }
}

class MatchMakingViewModel extends BaseModel<AppState> {
  MatchMakingViewModel();

  VoidCallback onExit;

  MatchMakingViewModel.build({
    @required this.onExit,
  });

  @override
  MatchMakingViewModel fromStore() => MatchMakingViewModel.build(
        onExit: () => dispatch(ExitMatchMakingAction()),
      );
}
