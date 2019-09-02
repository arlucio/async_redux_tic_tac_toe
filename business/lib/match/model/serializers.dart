import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:business/match/model/match_data.dart';
import 'package:business/match/model/quote_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  Quote,
  MatchData,
  LastPlayData,
])
final Serializers serializers = _$serializers;
final Serializers standardSerializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
