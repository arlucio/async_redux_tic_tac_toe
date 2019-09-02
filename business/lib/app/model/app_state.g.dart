// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final MatchState matchState;
  @override
  final HomePlayerState homePlayerState;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.matchState, this.homePlayerState}) : super._() {
    if (matchState == null) {
      throw new BuiltValueNullFieldError('AppState', 'matchState');
    }
    if (homePlayerState == null) {
      throw new BuiltValueNullFieldError('AppState', 'homePlayerState');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        matchState == other.matchState &&
        homePlayerState == other.homePlayerState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, matchState.hashCode), homePlayerState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('matchState', matchState)
          ..add('homePlayerState', homePlayerState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  MatchStateBuilder _matchState;
  MatchStateBuilder get matchState =>
      _$this._matchState ??= new MatchStateBuilder();
  set matchState(MatchStateBuilder matchState) =>
      _$this._matchState = matchState;

  HomePlayerStateBuilder _homePlayerState;
  HomePlayerStateBuilder get homePlayerState =>
      _$this._homePlayerState ??= new HomePlayerStateBuilder();
  set homePlayerState(HomePlayerStateBuilder homePlayerState) =>
      _$this._homePlayerState = homePlayerState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _matchState = _$v.matchState?.toBuilder();
      _homePlayerState = _$v.homePlayerState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              matchState: matchState.build(),
              homePlayerState: homePlayerState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'matchState';
        matchState.build();
        _$failedField = 'homePlayerState';
        homePlayerState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
