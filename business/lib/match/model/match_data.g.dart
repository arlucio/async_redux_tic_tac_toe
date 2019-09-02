// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MatchData> _$matchDataSerializer = new _$MatchDataSerializer();
Serializer<LastPlayData> _$lastPlayDataSerializer =
    new _$LastPlayDataSerializer();

class _$MatchDataSerializer implements StructuredSerializer<MatchData> {
  @override
  final Iterable<Type> types = const [MatchData, _$MatchData];
  @override
  final String wireName = 'MatchData';

  @override
  Iterable<Object> serialize(Serializers serializers, MatchData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'playerOneName',
      serializers.serialize(object.playerOneName,
          specifiedType: const FullType(String)),
      'playerTwoName',
      serializers.serialize(object.playerTwoName,
          specifiedType: const FullType(String)),
      'playerOneId',
      serializers.serialize(object.playerOneId,
          specifiedType: const FullType(String)),
      'playerTwoId',
      serializers.serialize(object.playerTwoId,
          specifiedType: const FullType(String)),
      'playerTurn',
      serializers.serialize(object.playerTurn,
          specifiedType: const FullType(String)),
    ];
    if (object.lastPlay != null) {
      result
        ..add('lastPlay')
        ..add(serializers.serialize(object.lastPlay,
            specifiedType: const FullType(LastPlayData)));
    }
    return result;
  }

  @override
  MatchData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MatchDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'playerOneName':
          result.playerOneName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'playerTwoName':
          result.playerTwoName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'playerOneId':
          result.playerOneId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'playerTwoId':
          result.playerTwoId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'playerTurn':
          result.playerTurn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastPlay':
          result.lastPlay.replace(serializers.deserialize(value,
              specifiedType: const FullType(LastPlayData)) as LastPlayData);
          break;
      }
    }

    return result.build();
  }
}

class _$LastPlayDataSerializer implements StructuredSerializer<LastPlayData> {
  @override
  final Iterable<Type> types = const [LastPlayData, _$LastPlayData];
  @override
  final String wireName = 'LastPlayData';

  @override
  Iterable<Object> serialize(Serializers serializers, LastPlayData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'playNumber',
      serializers.serialize(object.playNumber,
          specifiedType: const FullType(int)),
      'playType',
      serializers.serialize(object.playType,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LastPlayData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LastPlayDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'playNumber':
          result.playNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'playType':
          result.playType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MatchData extends MatchData {
  @override
  final String playerOneName;
  @override
  final String playerTwoName;
  @override
  final String playerOneId;
  @override
  final String playerTwoId;
  @override
  final String playerTurn;
  @override
  final LastPlayData lastPlay;

  factory _$MatchData([void Function(MatchDataBuilder) updates]) =>
      (new MatchDataBuilder()..update(updates)).build();

  _$MatchData._(
      {this.playerOneName,
      this.playerTwoName,
      this.playerOneId,
      this.playerTwoId,
      this.playerTurn,
      this.lastPlay})
      : super._() {
    if (playerOneName == null) {
      throw new BuiltValueNullFieldError('MatchData', 'playerOneName');
    }
    if (playerTwoName == null) {
      throw new BuiltValueNullFieldError('MatchData', 'playerTwoName');
    }
    if (playerOneId == null) {
      throw new BuiltValueNullFieldError('MatchData', 'playerOneId');
    }
    if (playerTwoId == null) {
      throw new BuiltValueNullFieldError('MatchData', 'playerTwoId');
    }
    if (playerTurn == null) {
      throw new BuiltValueNullFieldError('MatchData', 'playerTurn');
    }
  }

  @override
  MatchData rebuild(void Function(MatchDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MatchDataBuilder toBuilder() => new MatchDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchData &&
        playerOneName == other.playerOneName &&
        playerTwoName == other.playerTwoName &&
        playerOneId == other.playerOneId &&
        playerTwoId == other.playerTwoId &&
        playerTurn == other.playerTurn &&
        lastPlay == other.lastPlay;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, playerOneName.hashCode), playerTwoName.hashCode),
                    playerOneId.hashCode),
                playerTwoId.hashCode),
            playerTurn.hashCode),
        lastPlay.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MatchData')
          ..add('playerOneName', playerOneName)
          ..add('playerTwoName', playerTwoName)
          ..add('playerOneId', playerOneId)
          ..add('playerTwoId', playerTwoId)
          ..add('playerTurn', playerTurn)
          ..add('lastPlay', lastPlay))
        .toString();
  }
}

class MatchDataBuilder implements Builder<MatchData, MatchDataBuilder> {
  _$MatchData _$v;

  String _playerOneName;
  String get playerOneName => _$this._playerOneName;
  set playerOneName(String playerOneName) =>
      _$this._playerOneName = playerOneName;

  String _playerTwoName;
  String get playerTwoName => _$this._playerTwoName;
  set playerTwoName(String playerTwoName) =>
      _$this._playerTwoName = playerTwoName;

  String _playerOneId;
  String get playerOneId => _$this._playerOneId;
  set playerOneId(String playerOneId) => _$this._playerOneId = playerOneId;

  String _playerTwoId;
  String get playerTwoId => _$this._playerTwoId;
  set playerTwoId(String playerTwoId) => _$this._playerTwoId = playerTwoId;

  String _playerTurn;
  String get playerTurn => _$this._playerTurn;
  set playerTurn(String playerTurn) => _$this._playerTurn = playerTurn;

  LastPlayDataBuilder _lastPlay;
  LastPlayDataBuilder get lastPlay =>
      _$this._lastPlay ??= new LastPlayDataBuilder();
  set lastPlay(LastPlayDataBuilder lastPlay) => _$this._lastPlay = lastPlay;

  MatchDataBuilder();

  MatchDataBuilder get _$this {
    if (_$v != null) {
      _playerOneName = _$v.playerOneName;
      _playerTwoName = _$v.playerTwoName;
      _playerOneId = _$v.playerOneId;
      _playerTwoId = _$v.playerTwoId;
      _playerTurn = _$v.playerTurn;
      _lastPlay = _$v.lastPlay?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MatchData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MatchData;
  }

  @override
  void update(void Function(MatchDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MatchData build() {
    _$MatchData _$result;
    try {
      _$result = _$v ??
          new _$MatchData._(
              playerOneName: playerOneName,
              playerTwoName: playerTwoName,
              playerOneId: playerOneId,
              playerTwoId: playerTwoId,
              playerTurn: playerTurn,
              lastPlay: _lastPlay?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lastPlay';
        _lastPlay?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MatchData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$LastPlayData extends LastPlayData {
  @override
  final int playNumber;
  @override
  final String playType;

  factory _$LastPlayData([void Function(LastPlayDataBuilder) updates]) =>
      (new LastPlayDataBuilder()..update(updates)).build();

  _$LastPlayData._({this.playNumber, this.playType}) : super._() {
    if (playNumber == null) {
      throw new BuiltValueNullFieldError('LastPlayData', 'playNumber');
    }
    if (playType == null) {
      throw new BuiltValueNullFieldError('LastPlayData', 'playType');
    }
  }

  @override
  LastPlayData rebuild(void Function(LastPlayDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LastPlayDataBuilder toBuilder() => new LastPlayDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LastPlayData &&
        playNumber == other.playNumber &&
        playType == other.playType;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, playNumber.hashCode), playType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LastPlayData')
          ..add('playNumber', playNumber)
          ..add('playType', playType))
        .toString();
  }
}

class LastPlayDataBuilder
    implements Builder<LastPlayData, LastPlayDataBuilder> {
  _$LastPlayData _$v;

  int _playNumber;
  int get playNumber => _$this._playNumber;
  set playNumber(int playNumber) => _$this._playNumber = playNumber;

  String _playType;
  String get playType => _$this._playType;
  set playType(String playType) => _$this._playType = playType;

  LastPlayDataBuilder();

  LastPlayDataBuilder get _$this {
    if (_$v != null) {
      _playNumber = _$v.playNumber;
      _playType = _$v.playType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LastPlayData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LastPlayData;
  }

  @override
  void update(void Function(LastPlayDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LastPlayData build() {
    final _$result =
        _$v ?? new _$LastPlayData._(playNumber: playNumber, playType: playType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
