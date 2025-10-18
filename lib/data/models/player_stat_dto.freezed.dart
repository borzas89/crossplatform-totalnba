// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_stat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayerStatDto _$PlayerStatDtoFromJson(Map<String, dynamic> json) {
  return _PlayerStatDto.fromJson(json);
}

/// @nodoc
mixin _$PlayerStatDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String get team => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'game_played')
  int get gamePlayed => throw _privateConstructorUsedError;
  @JsonKey(name: 'points_per_game')
  double get pointsPerGame => throw _privateConstructorUsedError;
  @JsonKey(name: 'rebounds_per_game')
  double get reboundsPerGame => throw _privateConstructorUsedError;
  @JsonKey(name: 'assists_per_game')
  double get assistsPerGame => throw _privateConstructorUsedError;
  @JsonKey(name: 'steals_per_game')
  double? get stealsPerGame => throw _privateConstructorUsedError;
  @JsonKey(name: 'pics_id')
  String? get picsId => throw _privateConstructorUsedError;
  @JsonKey(name: 'two_points_per_game')
  double? get twoPointsPerGame => throw _privateConstructorUsedError;
  @JsonKey(name: 'three_points_per_game')
  double? get threePointsPerGame => throw _privateConstructorUsedError;
  @JsonKey(name: 'pra_per_game')
  double? get praPerGame => throw _privateConstructorUsedError;
  @JsonKey(name: 'points_assists_per_game')
  double? get pointsAssistsPerGame => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerStatDtoCopyWith<PlayerStatDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStatDtoCopyWith<$Res> {
  factory $PlayerStatDtoCopyWith(
          PlayerStatDto value, $Res Function(PlayerStatDto) then) =
      _$PlayerStatDtoCopyWithImpl<$Res, PlayerStatDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'full_name') String fullName,
      String team,
      String position,
      @JsonKey(name: 'game_played') int gamePlayed,
      @JsonKey(name: 'points_per_game') double pointsPerGame,
      @JsonKey(name: 'rebounds_per_game') double reboundsPerGame,
      @JsonKey(name: 'assists_per_game') double assistsPerGame,
      @JsonKey(name: 'steals_per_game') double? stealsPerGame,
      @JsonKey(name: 'pics_id') String? picsId,
      @JsonKey(name: 'two_points_per_game') double? twoPointsPerGame,
      @JsonKey(name: 'three_points_per_game') double? threePointsPerGame,
      @JsonKey(name: 'pra_per_game') double? praPerGame,
      @JsonKey(name: 'points_assists_per_game') double? pointsAssistsPerGame});
}

/// @nodoc
class _$PlayerStatDtoCopyWithImpl<$Res, $Val extends PlayerStatDto>
    implements $PlayerStatDtoCopyWith<$Res> {
  _$PlayerStatDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? team = null,
    Object? position = null,
    Object? gamePlayed = null,
    Object? pointsPerGame = null,
    Object? reboundsPerGame = null,
    Object? assistsPerGame = null,
    Object? stealsPerGame = freezed,
    Object? picsId = freezed,
    Object? twoPointsPerGame = freezed,
    Object? threePointsPerGame = freezed,
    Object? praPerGame = freezed,
    Object? pointsAssistsPerGame = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      gamePlayed: null == gamePlayed
          ? _value.gamePlayed
          : gamePlayed // ignore: cast_nullable_to_non_nullable
              as int,
      pointsPerGame: null == pointsPerGame
          ? _value.pointsPerGame
          : pointsPerGame // ignore: cast_nullable_to_non_nullable
              as double,
      reboundsPerGame: null == reboundsPerGame
          ? _value.reboundsPerGame
          : reboundsPerGame // ignore: cast_nullable_to_non_nullable
              as double,
      assistsPerGame: null == assistsPerGame
          ? _value.assistsPerGame
          : assistsPerGame // ignore: cast_nullable_to_non_nullable
              as double,
      stealsPerGame: freezed == stealsPerGame
          ? _value.stealsPerGame
          : stealsPerGame // ignore: cast_nullable_to_non_nullable
              as double?,
      picsId: freezed == picsId
          ? _value.picsId
          : picsId // ignore: cast_nullable_to_non_nullable
              as String?,
      twoPointsPerGame: freezed == twoPointsPerGame
          ? _value.twoPointsPerGame
          : twoPointsPerGame // ignore: cast_nullable_to_non_nullable
              as double?,
      threePointsPerGame: freezed == threePointsPerGame
          ? _value.threePointsPerGame
          : threePointsPerGame // ignore: cast_nullable_to_non_nullable
              as double?,
      praPerGame: freezed == praPerGame
          ? _value.praPerGame
          : praPerGame // ignore: cast_nullable_to_non_nullable
              as double?,
      pointsAssistsPerGame: freezed == pointsAssistsPerGame
          ? _value.pointsAssistsPerGame
          : pointsAssistsPerGame // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerStatDtoImplCopyWith<$Res>
    implements $PlayerStatDtoCopyWith<$Res> {
  factory _$$PlayerStatDtoImplCopyWith(
          _$PlayerStatDtoImpl value, $Res Function(_$PlayerStatDtoImpl) then) =
      __$$PlayerStatDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'full_name') String fullName,
      String team,
      String position,
      @JsonKey(name: 'game_played') int gamePlayed,
      @JsonKey(name: 'points_per_game') double pointsPerGame,
      @JsonKey(name: 'rebounds_per_game') double reboundsPerGame,
      @JsonKey(name: 'assists_per_game') double assistsPerGame,
      @JsonKey(name: 'steals_per_game') double? stealsPerGame,
      @JsonKey(name: 'pics_id') String? picsId,
      @JsonKey(name: 'two_points_per_game') double? twoPointsPerGame,
      @JsonKey(name: 'three_points_per_game') double? threePointsPerGame,
      @JsonKey(name: 'pra_per_game') double? praPerGame,
      @JsonKey(name: 'points_assists_per_game') double? pointsAssistsPerGame});
}

/// @nodoc
class __$$PlayerStatDtoImplCopyWithImpl<$Res>
    extends _$PlayerStatDtoCopyWithImpl<$Res, _$PlayerStatDtoImpl>
    implements _$$PlayerStatDtoImplCopyWith<$Res> {
  __$$PlayerStatDtoImplCopyWithImpl(
      _$PlayerStatDtoImpl _value, $Res Function(_$PlayerStatDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? team = null,
    Object? position = null,
    Object? gamePlayed = null,
    Object? pointsPerGame = null,
    Object? reboundsPerGame = null,
    Object? assistsPerGame = null,
    Object? stealsPerGame = freezed,
    Object? picsId = freezed,
    Object? twoPointsPerGame = freezed,
    Object? threePointsPerGame = freezed,
    Object? praPerGame = freezed,
    Object? pointsAssistsPerGame = freezed,
  }) {
    return _then(_$PlayerStatDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      gamePlayed: null == gamePlayed
          ? _value.gamePlayed
          : gamePlayed // ignore: cast_nullable_to_non_nullable
              as int,
      pointsPerGame: null == pointsPerGame
          ? _value.pointsPerGame
          : pointsPerGame // ignore: cast_nullable_to_non_nullable
              as double,
      reboundsPerGame: null == reboundsPerGame
          ? _value.reboundsPerGame
          : reboundsPerGame // ignore: cast_nullable_to_non_nullable
              as double,
      assistsPerGame: null == assistsPerGame
          ? _value.assistsPerGame
          : assistsPerGame // ignore: cast_nullable_to_non_nullable
              as double,
      stealsPerGame: freezed == stealsPerGame
          ? _value.stealsPerGame
          : stealsPerGame // ignore: cast_nullable_to_non_nullable
              as double?,
      picsId: freezed == picsId
          ? _value.picsId
          : picsId // ignore: cast_nullable_to_non_nullable
              as String?,
      twoPointsPerGame: freezed == twoPointsPerGame
          ? _value.twoPointsPerGame
          : twoPointsPerGame // ignore: cast_nullable_to_non_nullable
              as double?,
      threePointsPerGame: freezed == threePointsPerGame
          ? _value.threePointsPerGame
          : threePointsPerGame // ignore: cast_nullable_to_non_nullable
              as double?,
      praPerGame: freezed == praPerGame
          ? _value.praPerGame
          : praPerGame // ignore: cast_nullable_to_non_nullable
              as double?,
      pointsAssistsPerGame: freezed == pointsAssistsPerGame
          ? _value.pointsAssistsPerGame
          : pointsAssistsPerGame // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerStatDtoImpl implements _PlayerStatDto {
  const _$PlayerStatDtoImpl(
      {this.id = 0,
      @JsonKey(name: 'full_name') this.fullName = '',
      this.team = '',
      this.position = '',
      @JsonKey(name: 'game_played') this.gamePlayed = 0,
      @JsonKey(name: 'points_per_game') this.pointsPerGame = 0.0,
      @JsonKey(name: 'rebounds_per_game') this.reboundsPerGame = 0.0,
      @JsonKey(name: 'assists_per_game') this.assistsPerGame = 0.0,
      @JsonKey(name: 'steals_per_game') this.stealsPerGame,
      @JsonKey(name: 'pics_id') this.picsId,
      @JsonKey(name: 'two_points_per_game') this.twoPointsPerGame,
      @JsonKey(name: 'three_points_per_game') this.threePointsPerGame,
      @JsonKey(name: 'pra_per_game') this.praPerGame,
      @JsonKey(name: 'points_assists_per_game') this.pointsAssistsPerGame});

  factory _$PlayerStatDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerStatDtoImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey()
  final String team;
  @override
  @JsonKey()
  final String position;
  @override
  @JsonKey(name: 'game_played')
  final int gamePlayed;
  @override
  @JsonKey(name: 'points_per_game')
  final double pointsPerGame;
  @override
  @JsonKey(name: 'rebounds_per_game')
  final double reboundsPerGame;
  @override
  @JsonKey(name: 'assists_per_game')
  final double assistsPerGame;
  @override
  @JsonKey(name: 'steals_per_game')
  final double? stealsPerGame;
  @override
  @JsonKey(name: 'pics_id')
  final String? picsId;
  @override
  @JsonKey(name: 'two_points_per_game')
  final double? twoPointsPerGame;
  @override
  @JsonKey(name: 'three_points_per_game')
  final double? threePointsPerGame;
  @override
  @JsonKey(name: 'pra_per_game')
  final double? praPerGame;
  @override
  @JsonKey(name: 'points_assists_per_game')
  final double? pointsAssistsPerGame;

  @override
  String toString() {
    return 'PlayerStatDto(id: $id, fullName: $fullName, team: $team, position: $position, gamePlayed: $gamePlayed, pointsPerGame: $pointsPerGame, reboundsPerGame: $reboundsPerGame, assistsPerGame: $assistsPerGame, stealsPerGame: $stealsPerGame, picsId: $picsId, twoPointsPerGame: $twoPointsPerGame, threePointsPerGame: $threePointsPerGame, praPerGame: $praPerGame, pointsAssistsPerGame: $pointsAssistsPerGame)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerStatDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.gamePlayed, gamePlayed) ||
                other.gamePlayed == gamePlayed) &&
            (identical(other.pointsPerGame, pointsPerGame) ||
                other.pointsPerGame == pointsPerGame) &&
            (identical(other.reboundsPerGame, reboundsPerGame) ||
                other.reboundsPerGame == reboundsPerGame) &&
            (identical(other.assistsPerGame, assistsPerGame) ||
                other.assistsPerGame == assistsPerGame) &&
            (identical(other.stealsPerGame, stealsPerGame) ||
                other.stealsPerGame == stealsPerGame) &&
            (identical(other.picsId, picsId) || other.picsId == picsId) &&
            (identical(other.twoPointsPerGame, twoPointsPerGame) ||
                other.twoPointsPerGame == twoPointsPerGame) &&
            (identical(other.threePointsPerGame, threePointsPerGame) ||
                other.threePointsPerGame == threePointsPerGame) &&
            (identical(other.praPerGame, praPerGame) ||
                other.praPerGame == praPerGame) &&
            (identical(other.pointsAssistsPerGame, pointsAssistsPerGame) ||
                other.pointsAssistsPerGame == pointsAssistsPerGame));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      team,
      position,
      gamePlayed,
      pointsPerGame,
      reboundsPerGame,
      assistsPerGame,
      stealsPerGame,
      picsId,
      twoPointsPerGame,
      threePointsPerGame,
      praPerGame,
      pointsAssistsPerGame);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerStatDtoImplCopyWith<_$PlayerStatDtoImpl> get copyWith =>
      __$$PlayerStatDtoImplCopyWithImpl<_$PlayerStatDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerStatDtoImplToJson(
      this,
    );
  }
}

abstract class _PlayerStatDto implements PlayerStatDto {
  const factory _PlayerStatDto(
      {final int id,
      @JsonKey(name: 'full_name') final String fullName,
      final String team,
      final String position,
      @JsonKey(name: 'game_played') final int gamePlayed,
      @JsonKey(name: 'points_per_game') final double pointsPerGame,
      @JsonKey(name: 'rebounds_per_game') final double reboundsPerGame,
      @JsonKey(name: 'assists_per_game') final double assistsPerGame,
      @JsonKey(name: 'steals_per_game') final double? stealsPerGame,
      @JsonKey(name: 'pics_id') final String? picsId,
      @JsonKey(name: 'two_points_per_game') final double? twoPointsPerGame,
      @JsonKey(name: 'three_points_per_game') final double? threePointsPerGame,
      @JsonKey(name: 'pra_per_game') final double? praPerGame,
      @JsonKey(name: 'points_assists_per_game')
      final double? pointsAssistsPerGame}) = _$PlayerStatDtoImpl;

  factory _PlayerStatDto.fromJson(Map<String, dynamic> json) =
      _$PlayerStatDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String get team;
  @override
  String get position;
  @override
  @JsonKey(name: 'game_played')
  int get gamePlayed;
  @override
  @JsonKey(name: 'points_per_game')
  double get pointsPerGame;
  @override
  @JsonKey(name: 'rebounds_per_game')
  double get reboundsPerGame;
  @override
  @JsonKey(name: 'assists_per_game')
  double get assistsPerGame;
  @override
  @JsonKey(name: 'steals_per_game')
  double? get stealsPerGame;
  @override
  @JsonKey(name: 'pics_id')
  String? get picsId;
  @override
  @JsonKey(name: 'two_points_per_game')
  double? get twoPointsPerGame;
  @override
  @JsonKey(name: 'three_points_per_game')
  double? get threePointsPerGame;
  @override
  @JsonKey(name: 'pra_per_game')
  double? get praPerGame;
  @override
  @JsonKey(name: 'points_assists_per_game')
  double? get pointsAssistsPerGame;
  @override
  @JsonKey(ignore: true)
  _$$PlayerStatDtoImplCopyWith<_$PlayerStatDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
