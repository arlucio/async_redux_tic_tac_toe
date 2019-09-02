import 'package:built_value/built_value.dart';
import 'package:faker/faker.dart';

part 'player_model.g.dart';

abstract class Player implements Built<Player, PlayerBuilder> {
  PlayerNumber get number;
  @nullable
  String get name;
  @nullable
  String get id;
  String get ephemeralName;

  factory Player.initialState(String playerID) => Player((b) => b
    ..number = PlayerNumber.none
    ..name = Faker().internet.userName()
    ..id = playerID
    ..ephemeralName = '');

  factory Player([updates(PlayerBuilder b)]) = _$Player;
  Player._();
}

enum PlayerNumber { one, two, none, neither } // Neither here is just to be able to make the 'draw" case
