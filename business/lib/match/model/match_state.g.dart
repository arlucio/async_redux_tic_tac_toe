// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MatchState extends MatchState {
  @override
  final String exitMatchPlayer;
  @override
  final int scoreHomePlayer;
  @override
  final int scoreVisitingPlayer;
  @override
  final String matchID;
  @override
  final String playerTurn;
  @override
  final PlayerNumber winnerPlayer;
  @override
  final Player visitingPlayer;
  @override
  final BuiltList<String> hashState;

  factory _$MatchState([void Function(MatchStateBuilder) updates]) =>
      (new MatchStateBuilder()..update(updates)).build();

  _$MatchState._(
      {this.exitMatchPlayer,
      this.scoreHomePlayer,
      this.scoreVisitingPlayer,
      this.matchID,
      this.playerTurn,
      this.winnerPlayer,
      this.visitingPlayer,
      this.hashState})
      : super._() {
    if (exitMatchPlayer == null) {
      throw new BuiltValueNullFieldError('MatchState', 'exitMatchPlayer');
    }
    if (scoreHomePlayer == null) {
      throw new BuiltValueNullFieldError('MatchState', 'scoreHomePlayer');
    }
    if (scoreVisitingPlayer == null) {
      throw new BuiltValueNullFieldError('MatchState', 'scoreVisitingPlayer');
    }
    if (playerTurn == null) {
      throw new BuiltValueNullFieldError('MatchState', 'playerTurn');
    }
    if (winnerPlayer == null) {
      throw new BuiltValueNullFieldError('MatchState', 'winnerPlayer');
    }
    if (visitingPlayer == null) {
      throw new BuiltValueNullFieldError('MatchState', 'visitingPlayer');
    }
    if (hashState == null) {
      throw new BuiltValueNullFieldError('MatchState', 'hashState');
    }
  }

  @override
  MatchState rebuild(void Function(MatchStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MatchStateBuilder toBuilder() => new MatchStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchState &&
        exitMatchPlayer == other.exitMatchPlayer &&
        scoreHomePlayer == other.scoreHomePlayer &&
        scoreVisitingPlayer == other.scoreVisitingPlayer &&
        matchID == other.matchID &&
        playerTurn == other.playerTurn &&
        winnerPlayer == other.winnerPlayer &&
        visitingPlayer == other.visitingPlayer &&
        hashState == other.hashState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, exitMatchPlayer.hashCode),
                                scoreHomePlayer.hashCode),
                            scoreVisitingPlayer.hashCode),
                        matchID.hashCode),
                    playerTurn.hashCode),
                winnerPlayer.hashCode),
            visitingPlayer.hashCode),
        hashState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MatchState')
          ..add('exitMatchPlayer', exitMatchPlayer)
          ..add('scoreHomePlayer', scoreHomePlayer)
          ..add('scoreVisitingPlayer', scoreVisitingPlayer)
          ..add('matchID', matchID)
          ..add('playerTurn', playerTurn)
          ..add('winnerPlayer', winnerPlayer)
          ..add('visitingPlayer', visitingPlayer)
          ..add('hashState', hashState))
        .toString();
  }
}

class MatchStateBuilder implements Builder<MatchState, MatchStateBuilder> {
  _$MatchState _$v;

  String _exitMatchPlayer;
  String get exitMatchPlayer => _$this._exitMatchPlayer;
  set exitMatchPlayer(String exitMatchPlayer) =>
      _$this._exitMatchPlayer = exitMatchPlayer;

  int _scoreHomePlayer;
  int get scoreHomePlayer => _$this._scoreHomePlayer;
  set scoreHomePlayer(int scoreHomePlayer) =>
      _$this._scoreHomePlayer = scoreHomePlayer;

  int _scoreVisitingPlayer;
  int get scoreVisitingPlayer => _$this._scoreVisitingPlayer;
  set scoreVisitingPlayer(int scoreVisitingPlayer) =>
      _$this._scoreVisitingPlayer = scoreVisitingPlayer;

  String _matchID;
  String get matchID => _$this._matchID;
  set matchID(String matchID) => _$this._matchID = matchID;

  String _playerTurn;
  String get playerTurn => _$this._playerTurn;
  set playerTurn(String playerTurn) => _$this._playerTurn = playerTurn;

  PlayerNumber _winnerPlayer;
  PlayerNumber get winnerPlayer => _$this._winnerPlayer;
  set winnerPlayer(PlayerNumber winnerPlayer) =>
      _$this._winnerPlayer = winnerPlayer;

  PlayerBuilder _visitingPlayer;
  PlayerBuilder get visitingPlayer =>
      _$this._visitingPlayer ??= new PlayerBuilder();
  set visitingPlayer(PlayerBuilder visitingPlayer) =>
      _$this._visitingPlayer = visitingPlayer;

  ListBuilder<String> _hashState;
  ListBuilder<String> get hashState =>
      _$this._hashState ??= new ListBuilder<String>();
  set hashState(ListBuilder<String> hashState) => _$this._hashState = hashState;

  MatchStateBuilder();

  MatchStateBuilder get _$this {
    if (_$v != null) {
      _exitMatchPlayer = _$v.exitMatchPlayer;
      _scoreHomePlayer = _$v.scoreHomePlayer;
      _scoreVisitingPlayer = _$v.scoreVisitingPlayer;
      _matchID = _$v.matchID;
      _playerTurn = _$v.playerTurn;
      _winnerPlayer = _$v.winnerPlayer;
      _visitingPlayer = _$v.visitingPlayer?.toBuilder();
      _hashState = _$v.hashState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MatchState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MatchState;
  }

  @override
  void update(void Function(MatchStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MatchState build() {
    _$MatchState _$result;
    try {
      _$result = _$v ??
          new _$MatchState._(
              exitMatchPlayer: exitMatchPlayer,
              scoreHomePlayer: scoreHomePlayer,
              scoreVisitingPlayer: scoreVisitingPlayer,
              matchID: matchID,
              playerTurn: playerTurn,
              winnerPlayer: winnerPlayer,
              visitingPlayer: visitingPlayer.build(),
              hashState: hashState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'visitingPlayer';
        visitingPlayer.build();
        _$failedField = 'hashState';
        hashState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MatchState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
