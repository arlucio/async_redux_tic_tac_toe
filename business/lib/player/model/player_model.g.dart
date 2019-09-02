// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Player extends Player {
  @override
  final PlayerNumber number;
  @override
  final String name;
  @override
  final String id;
  @override
  final String ephemeralName;

  factory _$Player([void Function(PlayerBuilder) updates]) =>
      (new PlayerBuilder()..update(updates)).build();

  _$Player._({this.number, this.name, this.id, this.ephemeralName})
      : super._() {
    if (number == null) {
      throw new BuiltValueNullFieldError('Player', 'number');
    }
    if (ephemeralName == null) {
      throw new BuiltValueNullFieldError('Player', 'ephemeralName');
    }
  }

  @override
  Player rebuild(void Function(PlayerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlayerBuilder toBuilder() => new PlayerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Player &&
        number == other.number &&
        name == other.name &&
        id == other.id &&
        ephemeralName == other.ephemeralName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, number.hashCode), name.hashCode), id.hashCode),
        ephemeralName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Player')
          ..add('number', number)
          ..add('name', name)
          ..add('id', id)
          ..add('ephemeralName', ephemeralName))
        .toString();
  }
}

class PlayerBuilder implements Builder<Player, PlayerBuilder> {
  _$Player _$v;

  PlayerNumber _number;
  PlayerNumber get number => _$this._number;
  set number(PlayerNumber number) => _$this._number = number;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _ephemeralName;
  String get ephemeralName => _$this._ephemeralName;
  set ephemeralName(String ephemeralName) =>
      _$this._ephemeralName = ephemeralName;

  PlayerBuilder();

  PlayerBuilder get _$this {
    if (_$v != null) {
      _number = _$v.number;
      _name = _$v.name;
      _id = _$v.id;
      _ephemeralName = _$v.ephemeralName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Player other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Player;
  }

  @override
  void update(void Function(PlayerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Player build() {
    final _$result = _$v ??
        new _$Player._(
            number: number, name: name, id: id, ephemeralName: ephemeralName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
