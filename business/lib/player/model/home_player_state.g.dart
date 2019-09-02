// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_player_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomePlayerState extends HomePlayerState {
  @override
  final Player player;

  factory _$HomePlayerState([void Function(HomePlayerStateBuilder) updates]) =>
      (new HomePlayerStateBuilder()..update(updates)).build();

  _$HomePlayerState._({this.player}) : super._() {
    if (player == null) {
      throw new BuiltValueNullFieldError('HomePlayerState', 'player');
    }
  }

  @override
  HomePlayerState rebuild(void Function(HomePlayerStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomePlayerStateBuilder toBuilder() =>
      new HomePlayerStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomePlayerState && player == other.player;
  }

  @override
  int get hashCode {
    return $jf($jc(0, player.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomePlayerState')
          ..add('player', player))
        .toString();
  }
}

class HomePlayerStateBuilder
    implements Builder<HomePlayerState, HomePlayerStateBuilder> {
  _$HomePlayerState _$v;

  PlayerBuilder _player;
  PlayerBuilder get player => _$this._player ??= new PlayerBuilder();
  set player(PlayerBuilder player) => _$this._player = player;

  HomePlayerStateBuilder();

  HomePlayerStateBuilder get _$this {
    if (_$v != null) {
      _player = _$v.player?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomePlayerState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HomePlayerState;
  }

  @override
  void update(void Function(HomePlayerStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HomePlayerState build() {
    _$HomePlayerState _$result;
    try {
      _$result = _$v ?? new _$HomePlayerState._(player: player.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'player';
        player.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HomePlayerState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
