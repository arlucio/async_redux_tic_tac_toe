import 'package:business/app/model/app_base_action.dart';
import 'package:business/app/model/app_state.dart';
import 'package:faker/faker.dart';

class GenerateNewRandomNameAction extends AppBaseAction {
  @override
  AppState reduce() {
    return state.rebuild((b) => b
      ..homePlayerState.update(
        (b) => b..player.name = Faker().internet.userName(),
      ));
  }
}
