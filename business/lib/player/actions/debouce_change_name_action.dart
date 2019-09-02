import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:flutter/foundation.dart';

class DebounceChangeNameAction extends AppBaseAction {
  final String name;

  DebounceChangeNameAction({@required this.name});
  @override
  Future<AppState> reduce() async {
    await Future.delayed(Duration(milliseconds: 1000), () {});

    if (name == homePlayer.ephemeralName) {
      return state.rebuild((b) => b
        ..homePlayerState.update(
          (b) => b..player.name = name,
        ));
    }

    return null;
  }
}
