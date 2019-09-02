import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:business/player/actions/debouce_change_name_action.dart';
import 'package:flutter/foundation.dart';

/// This is a redux implementation that emulates rxdart debounce() without using streams.
/// We set ephemeralName String on state and wait 1 sec, if it have't changed after this time, than user stop typing
/// and we can then do something with this.
///
/// This is a great example to use in search engines, when you want to search the word the user is typing only
/// when he stops.

class ChangeNameWithDebounceAction extends AppBaseAction {
  final String name;

  ChangeNameWithDebounceAction({@required this.name});

  @override
  AppState reduce() {
    dispatch(DebounceChangeNameAction(name: name));

    return state.rebuild((b) => b
      ..homePlayerState.update(
        (b) => b..player.ephemeralName = name,
      ));
  }
}
