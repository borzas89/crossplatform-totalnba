// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nba_player_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NbaPlayerDto _$NbaPlayerDtoFromJson(Map<String, dynamic> json) {
  return _NbaPlayerDto.fromJson(json);
}

/// @nodoc
mixin _$NbaPlayerDto {
  int get id => throw _privateConstructorUsedError;
  int get personId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get teamAbbreviation => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;
  int get rosterStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NbaPlayerDtoCopyWith<NbaPlayerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NbaPlayerDtoCopyWith<$Res> {
  factory $NbaPlayerDtoCopyWith(
          NbaPlayerDto value, $Res Function(NbaPlayerDto) then) =
      _$NbaPlayerDtoCopyWithImpl<$Res, NbaPlayerDto>;
  @useResult
  $Res call(
      {int id,
      int personId,
      String fullName,
      String firstName,
      String lastName,
      String? teamAbbreviation,
      String? position,
      int rosterStatus});
}

/// @nodoc
class _$NbaPlayerDtoCopyWithImpl<$Res, $Val extends NbaPlayerDto>
    implements $NbaPlayerDtoCopyWith<$Res> {
  _$NbaPlayerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? personId = null,
    Object? fullName = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? teamAbbreviation = freezed,
    Object? position = freezed,
    Object? rosterStatus = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      teamAbbreviation: freezed == teamAbbreviation
          ? _value.teamAbbreviation
          : teamAbbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      rosterStatus: null == rosterStatus
          ? _value.rosterStatus
          : rosterStatus // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NbaPlayerDtoImplCopyWith<$Res>
    implements $NbaPlayerDtoCopyWith<$Res> {
  factory _$$NbaPlayerDtoImplCopyWith(
          _$NbaPlayerDtoImpl value, $Res Function(_$NbaPlayerDtoImpl) then) =
      __$$NbaPlayerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int personId,
      String fullName,
      String firstName,
      String lastName,
      String? teamAbbreviation,
      String? position,
      int rosterStatus});
}

/// @nodoc
class __$$NbaPlayerDtoImplCopyWithImpl<$Res>
    extends _$NbaPlayerDtoCopyWithImpl<$Res, _$NbaPlayerDtoImpl>
    implements _$$NbaPlayerDtoImplCopyWith<$Res> {
  __$$NbaPlayerDtoImplCopyWithImpl(
      _$NbaPlayerDtoImpl _value, $Res Function(_$NbaPlayerDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? personId = null,
    Object? fullName = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? teamAbbreviation = freezed,
    Object? position = freezed,
    Object? rosterStatus = null,
  }) {
    return _then(_$NbaPlayerDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      teamAbbreviation: freezed == teamAbbreviation
          ? _value.teamAbbreviation
          : teamAbbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      rosterStatus: null == rosterStatus
          ? _value.rosterStatus
          : rosterStatus // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NbaPlayerDtoImpl implements _NbaPlayerDto {
  const _$NbaPlayerDtoImpl(
      {required this.id,
      required this.personId,
      required this.fullName,
      required this.firstName,
      required this.lastName,
      this.teamAbbreviation,
      this.position,
      this.rosterStatus = 0});

  factory _$NbaPlayerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NbaPlayerDtoImplFromJson(json);

  @override
  final int id;
  @override
  final int personId;
  @override
  final String fullName;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? teamAbbreviation;
  @override
  final String? position;
  @override
  @JsonKey()
  final int rosterStatus;

  @override
  String toString() {
    return 'NbaPlayerDto(id: $id, personId: $personId, fullName: $fullName, firstName: $firstName, lastName: $lastName, teamAbbreviation: $teamAbbreviation, position: $position, rosterStatus: $rosterStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NbaPlayerDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.teamAbbreviation, teamAbbreviation) ||
                other.teamAbbreviation == teamAbbreviation) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.rosterStatus, rosterStatus) ||
                other.rosterStatus == rosterStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, personId, fullName,
      firstName, lastName, teamAbbreviation, position, rosterStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NbaPlayerDtoImplCopyWith<_$NbaPlayerDtoImpl> get copyWith =>
      __$$NbaPlayerDtoImplCopyWithImpl<_$NbaPlayerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NbaPlayerDtoImplToJson(
      this,
    );
  }
}

abstract class _NbaPlayerDto implements NbaPlayerDto {
  const factory _NbaPlayerDto(
      {required final int id,
      required final int personId,
      required final String fullName,
      required final String firstName,
      required final String lastName,
      final String? teamAbbreviation,
      final String? position,
      final int rosterStatus}) = _$NbaPlayerDtoImpl;

  factory _NbaPlayerDto.fromJson(Map<String, dynamic> json) =
      _$NbaPlayerDtoImpl.fromJson;

  @override
  int get id;
  @override
  int get personId;
  @override
  String get fullName;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get teamAbbreviation;
  @override
  String? get position;
  @override
  int get rosterStatus;
  @override
  @JsonKey(ignore: true)
  _$$NbaPlayerDtoImplCopyWith<_$NbaPlayerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
