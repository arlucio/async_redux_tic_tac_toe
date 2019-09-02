import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'match_data.g.dart';

abstract class MatchData implements Built<MatchData, MatchDataBuilder> {
  String get playerOneName;
  String get playerTwoName;
  String get playerOneId;
  String get playerTwoId;
  String get playerTurn;

  @nullable
  LastPlayData get lastPlay;

  factory MatchData([updates(MatchDataBuilder b)]) = _$MatchData;
  static Serializer<MatchData> get serializer => _$matchDataSerializer;
  MatchData._();
}

abstract class LastPlayData implements Built<LastPlayData, LastPlayDataBuilder> {
  int get playNumber;
  String get playType;

  factory LastPlayData([updates(LastPlayDataBuilder b)]) = _$LastPlayData;
  static Serializer<LastPlayData> get serializer => _$lastPlayDataSerializer;
  LastPlayData._();
}
