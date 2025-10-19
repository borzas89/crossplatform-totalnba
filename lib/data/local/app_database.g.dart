// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PlayerStatsTable extends PlayerStats
    with TableInfo<$PlayerStatsTable, PlayerStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _teamMeta = const VerificationMeta('team');
  @override
  late final GeneratedColumn<String> team = GeneratedColumn<String>(
      'team', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
      'position', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _gamePlayedMeta =
      const VerificationMeta('gamePlayed');
  @override
  late final GeneratedColumn<int> gamePlayed = GeneratedColumn<int>(
      'game_played', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _pointsPerGameMeta =
      const VerificationMeta('pointsPerGame');
  @override
  late final GeneratedColumn<double> pointsPerGame = GeneratedColumn<double>(
      'points_per_game', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _reboundsPerGameMeta =
      const VerificationMeta('reboundsPerGame');
  @override
  late final GeneratedColumn<double> reboundsPerGame = GeneratedColumn<double>(
      'rebounds_per_game', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _assistsPerGameMeta =
      const VerificationMeta('assistsPerGame');
  @override
  late final GeneratedColumn<double> assistsPerGame = GeneratedColumn<double>(
      'assists_per_game', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _stealsPerGameMeta =
      const VerificationMeta('stealsPerGame');
  @override
  late final GeneratedColumn<double> stealsPerGame = GeneratedColumn<double>(
      'steals_per_game', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _twoPointsPerGameMeta =
      const VerificationMeta('twoPointsPerGame');
  @override
  late final GeneratedColumn<double> twoPointsPerGame = GeneratedColumn<double>(
      'two_points_per_game', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _threePointsPerGameMeta =
      const VerificationMeta('threePointsPerGame');
  @override
  late final GeneratedColumn<double> threePointsPerGame =
      GeneratedColumn<double>('three_points_per_game', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        fullName,
        team,
        position,
        gamePlayed,
        pointsPerGame,
        reboundsPerGame,
        assistsPerGame,
        stealsPerGame,
        twoPointsPerGame,
        threePointsPerGame,
        lastUpdated
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'player_stats';
  @override
  VerificationContext validateIntegrity(Insertable<PlayerStat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('team')) {
      context.handle(
          _teamMeta, team.isAcceptableOrUnknown(data['team']!, _teamMeta));
    } else if (isInserting) {
      context.missing(_teamMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('game_played')) {
      context.handle(
          _gamePlayedMeta,
          gamePlayed.isAcceptableOrUnknown(
              data['game_played']!, _gamePlayedMeta));
    }
    if (data.containsKey('points_per_game')) {
      context.handle(
          _pointsPerGameMeta,
          pointsPerGame.isAcceptableOrUnknown(
              data['points_per_game']!, _pointsPerGameMeta));
    }
    if (data.containsKey('rebounds_per_game')) {
      context.handle(
          _reboundsPerGameMeta,
          reboundsPerGame.isAcceptableOrUnknown(
              data['rebounds_per_game']!, _reboundsPerGameMeta));
    }
    if (data.containsKey('assists_per_game')) {
      context.handle(
          _assistsPerGameMeta,
          assistsPerGame.isAcceptableOrUnknown(
              data['assists_per_game']!, _assistsPerGameMeta));
    }
    if (data.containsKey('steals_per_game')) {
      context.handle(
          _stealsPerGameMeta,
          stealsPerGame.isAcceptableOrUnknown(
              data['steals_per_game']!, _stealsPerGameMeta));
    }
    if (data.containsKey('two_points_per_game')) {
      context.handle(
          _twoPointsPerGameMeta,
          twoPointsPerGame.isAcceptableOrUnknown(
              data['two_points_per_game']!, _twoPointsPerGameMeta));
    }
    if (data.containsKey('three_points_per_game')) {
      context.handle(
          _threePointsPerGameMeta,
          threePointsPerGame.isAcceptableOrUnknown(
              data['three_points_per_game']!, _threePointsPerGameMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerStat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      team: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}team'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}position'])!,
      gamePlayed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_played'])!,
      pointsPerGame: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}points_per_game'])!,
      reboundsPerGame: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}rebounds_per_game'])!,
      assistsPerGame: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}assists_per_game'])!,
      stealsPerGame: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}steals_per_game']),
      twoPointsPerGame: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}two_points_per_game']),
      threePointsPerGame: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}three_points_per_game']),
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $PlayerStatsTable createAlias(String alias) {
    return $PlayerStatsTable(attachedDatabase, alias);
  }
}

class PlayerStat extends DataClass implements Insertable<PlayerStat> {
  final int id;
  final String fullName;
  final String team;
  final String position;
  final int gamePlayed;
  final double pointsPerGame;
  final double reboundsPerGame;
  final double assistsPerGame;
  final double? stealsPerGame;
  final double? twoPointsPerGame;
  final double? threePointsPerGame;
  final DateTime lastUpdated;
  const PlayerStat(
      {required this.id,
      required this.fullName,
      required this.team,
      required this.position,
      required this.gamePlayed,
      required this.pointsPerGame,
      required this.reboundsPerGame,
      required this.assistsPerGame,
      this.stealsPerGame,
      this.twoPointsPerGame,
      this.threePointsPerGame,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['team'] = Variable<String>(team);
    map['position'] = Variable<String>(position);
    map['game_played'] = Variable<int>(gamePlayed);
    map['points_per_game'] = Variable<double>(pointsPerGame);
    map['rebounds_per_game'] = Variable<double>(reboundsPerGame);
    map['assists_per_game'] = Variable<double>(assistsPerGame);
    if (!nullToAbsent || stealsPerGame != null) {
      map['steals_per_game'] = Variable<double>(stealsPerGame);
    }
    if (!nullToAbsent || twoPointsPerGame != null) {
      map['two_points_per_game'] = Variable<double>(twoPointsPerGame);
    }
    if (!nullToAbsent || threePointsPerGame != null) {
      map['three_points_per_game'] = Variable<double>(threePointsPerGame);
    }
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  PlayerStatsCompanion toCompanion(bool nullToAbsent) {
    return PlayerStatsCompanion(
      id: Value(id),
      fullName: Value(fullName),
      team: Value(team),
      position: Value(position),
      gamePlayed: Value(gamePlayed),
      pointsPerGame: Value(pointsPerGame),
      reboundsPerGame: Value(reboundsPerGame),
      assistsPerGame: Value(assistsPerGame),
      stealsPerGame: stealsPerGame == null && nullToAbsent
          ? const Value.absent()
          : Value(stealsPerGame),
      twoPointsPerGame: twoPointsPerGame == null && nullToAbsent
          ? const Value.absent()
          : Value(twoPointsPerGame),
      threePointsPerGame: threePointsPerGame == null && nullToAbsent
          ? const Value.absent()
          : Value(threePointsPerGame),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory PlayerStat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerStat(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      team: serializer.fromJson<String>(json['team']),
      position: serializer.fromJson<String>(json['position']),
      gamePlayed: serializer.fromJson<int>(json['gamePlayed']),
      pointsPerGame: serializer.fromJson<double>(json['pointsPerGame']),
      reboundsPerGame: serializer.fromJson<double>(json['reboundsPerGame']),
      assistsPerGame: serializer.fromJson<double>(json['assistsPerGame']),
      stealsPerGame: serializer.fromJson<double?>(json['stealsPerGame']),
      twoPointsPerGame: serializer.fromJson<double?>(json['twoPointsPerGame']),
      threePointsPerGame:
          serializer.fromJson<double?>(json['threePointsPerGame']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'team': serializer.toJson<String>(team),
      'position': serializer.toJson<String>(position),
      'gamePlayed': serializer.toJson<int>(gamePlayed),
      'pointsPerGame': serializer.toJson<double>(pointsPerGame),
      'reboundsPerGame': serializer.toJson<double>(reboundsPerGame),
      'assistsPerGame': serializer.toJson<double>(assistsPerGame),
      'stealsPerGame': serializer.toJson<double?>(stealsPerGame),
      'twoPointsPerGame': serializer.toJson<double?>(twoPointsPerGame),
      'threePointsPerGame': serializer.toJson<double?>(threePointsPerGame),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  PlayerStat copyWith(
          {int? id,
          String? fullName,
          String? team,
          String? position,
          int? gamePlayed,
          double? pointsPerGame,
          double? reboundsPerGame,
          double? assistsPerGame,
          Value<double?> stealsPerGame = const Value.absent(),
          Value<double?> twoPointsPerGame = const Value.absent(),
          Value<double?> threePointsPerGame = const Value.absent(),
          DateTime? lastUpdated}) =>
      PlayerStat(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        team: team ?? this.team,
        position: position ?? this.position,
        gamePlayed: gamePlayed ?? this.gamePlayed,
        pointsPerGame: pointsPerGame ?? this.pointsPerGame,
        reboundsPerGame: reboundsPerGame ?? this.reboundsPerGame,
        assistsPerGame: assistsPerGame ?? this.assistsPerGame,
        stealsPerGame:
            stealsPerGame.present ? stealsPerGame.value : this.stealsPerGame,
        twoPointsPerGame: twoPointsPerGame.present
            ? twoPointsPerGame.value
            : this.twoPointsPerGame,
        threePointsPerGame: threePointsPerGame.present
            ? threePointsPerGame.value
            : this.threePointsPerGame,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  PlayerStat copyWithCompanion(PlayerStatsCompanion data) {
    return PlayerStat(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      team: data.team.present ? data.team.value : this.team,
      position: data.position.present ? data.position.value : this.position,
      gamePlayed:
          data.gamePlayed.present ? data.gamePlayed.value : this.gamePlayed,
      pointsPerGame: data.pointsPerGame.present
          ? data.pointsPerGame.value
          : this.pointsPerGame,
      reboundsPerGame: data.reboundsPerGame.present
          ? data.reboundsPerGame.value
          : this.reboundsPerGame,
      assistsPerGame: data.assistsPerGame.present
          ? data.assistsPerGame.value
          : this.assistsPerGame,
      stealsPerGame: data.stealsPerGame.present
          ? data.stealsPerGame.value
          : this.stealsPerGame,
      twoPointsPerGame: data.twoPointsPerGame.present
          ? data.twoPointsPerGame.value
          : this.twoPointsPerGame,
      threePointsPerGame: data.threePointsPerGame.present
          ? data.threePointsPerGame.value
          : this.threePointsPerGame,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerStat(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('team: $team, ')
          ..write('position: $position, ')
          ..write('gamePlayed: $gamePlayed, ')
          ..write('pointsPerGame: $pointsPerGame, ')
          ..write('reboundsPerGame: $reboundsPerGame, ')
          ..write('assistsPerGame: $assistsPerGame, ')
          ..write('stealsPerGame: $stealsPerGame, ')
          ..write('twoPointsPerGame: $twoPointsPerGame, ')
          ..write('threePointsPerGame: $threePointsPerGame, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      fullName,
      team,
      position,
      gamePlayed,
      pointsPerGame,
      reboundsPerGame,
      assistsPerGame,
      stealsPerGame,
      twoPointsPerGame,
      threePointsPerGame,
      lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerStat &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.team == this.team &&
          other.position == this.position &&
          other.gamePlayed == this.gamePlayed &&
          other.pointsPerGame == this.pointsPerGame &&
          other.reboundsPerGame == this.reboundsPerGame &&
          other.assistsPerGame == this.assistsPerGame &&
          other.stealsPerGame == this.stealsPerGame &&
          other.twoPointsPerGame == this.twoPointsPerGame &&
          other.threePointsPerGame == this.threePointsPerGame &&
          other.lastUpdated == this.lastUpdated);
}

class PlayerStatsCompanion extends UpdateCompanion<PlayerStat> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> team;
  final Value<String> position;
  final Value<int> gamePlayed;
  final Value<double> pointsPerGame;
  final Value<double> reboundsPerGame;
  final Value<double> assistsPerGame;
  final Value<double?> stealsPerGame;
  final Value<double?> twoPointsPerGame;
  final Value<double?> threePointsPerGame;
  final Value<DateTime> lastUpdated;
  const PlayerStatsCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.team = const Value.absent(),
    this.position = const Value.absent(),
    this.gamePlayed = const Value.absent(),
    this.pointsPerGame = const Value.absent(),
    this.reboundsPerGame = const Value.absent(),
    this.assistsPerGame = const Value.absent(),
    this.stealsPerGame = const Value.absent(),
    this.twoPointsPerGame = const Value.absent(),
    this.threePointsPerGame = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  });
  PlayerStatsCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String team,
    required String position,
    this.gamePlayed = const Value.absent(),
    this.pointsPerGame = const Value.absent(),
    this.reboundsPerGame = const Value.absent(),
    this.assistsPerGame = const Value.absent(),
    this.stealsPerGame = const Value.absent(),
    this.twoPointsPerGame = const Value.absent(),
    this.threePointsPerGame = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  })  : fullName = Value(fullName),
        team = Value(team),
        position = Value(position);
  static Insertable<PlayerStat> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? team,
    Expression<String>? position,
    Expression<int>? gamePlayed,
    Expression<double>? pointsPerGame,
    Expression<double>? reboundsPerGame,
    Expression<double>? assistsPerGame,
    Expression<double>? stealsPerGame,
    Expression<double>? twoPointsPerGame,
    Expression<double>? threePointsPerGame,
    Expression<DateTime>? lastUpdated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (team != null) 'team': team,
      if (position != null) 'position': position,
      if (gamePlayed != null) 'game_played': gamePlayed,
      if (pointsPerGame != null) 'points_per_game': pointsPerGame,
      if (reboundsPerGame != null) 'rebounds_per_game': reboundsPerGame,
      if (assistsPerGame != null) 'assists_per_game': assistsPerGame,
      if (stealsPerGame != null) 'steals_per_game': stealsPerGame,
      if (twoPointsPerGame != null) 'two_points_per_game': twoPointsPerGame,
      if (threePointsPerGame != null)
        'three_points_per_game': threePointsPerGame,
      if (lastUpdated != null) 'last_updated': lastUpdated,
    });
  }

  PlayerStatsCompanion copyWith(
      {Value<int>? id,
      Value<String>? fullName,
      Value<String>? team,
      Value<String>? position,
      Value<int>? gamePlayed,
      Value<double>? pointsPerGame,
      Value<double>? reboundsPerGame,
      Value<double>? assistsPerGame,
      Value<double?>? stealsPerGame,
      Value<double?>? twoPointsPerGame,
      Value<double?>? threePointsPerGame,
      Value<DateTime>? lastUpdated}) {
    return PlayerStatsCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      team: team ?? this.team,
      position: position ?? this.position,
      gamePlayed: gamePlayed ?? this.gamePlayed,
      pointsPerGame: pointsPerGame ?? this.pointsPerGame,
      reboundsPerGame: reboundsPerGame ?? this.reboundsPerGame,
      assistsPerGame: assistsPerGame ?? this.assistsPerGame,
      stealsPerGame: stealsPerGame ?? this.stealsPerGame,
      twoPointsPerGame: twoPointsPerGame ?? this.twoPointsPerGame,
      threePointsPerGame: threePointsPerGame ?? this.threePointsPerGame,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (team.present) {
      map['team'] = Variable<String>(team.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (gamePlayed.present) {
      map['game_played'] = Variable<int>(gamePlayed.value);
    }
    if (pointsPerGame.present) {
      map['points_per_game'] = Variable<double>(pointsPerGame.value);
    }
    if (reboundsPerGame.present) {
      map['rebounds_per_game'] = Variable<double>(reboundsPerGame.value);
    }
    if (assistsPerGame.present) {
      map['assists_per_game'] = Variable<double>(assistsPerGame.value);
    }
    if (stealsPerGame.present) {
      map['steals_per_game'] = Variable<double>(stealsPerGame.value);
    }
    if (twoPointsPerGame.present) {
      map['two_points_per_game'] = Variable<double>(twoPointsPerGame.value);
    }
    if (threePointsPerGame.present) {
      map['three_points_per_game'] = Variable<double>(threePointsPerGame.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerStatsCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('team: $team, ')
          ..write('position: $position, ')
          ..write('gamePlayed: $gamePlayed, ')
          ..write('pointsPerGame: $pointsPerGame, ')
          ..write('reboundsPerGame: $reboundsPerGame, ')
          ..write('assistsPerGame: $assistsPerGame, ')
          ..write('stealsPerGame: $stealsPerGame, ')
          ..write('twoPointsPerGame: $twoPointsPerGame, ')
          ..write('threePointsPerGame: $threePointsPerGame, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlayerStatsTable playerStats = $PlayerStatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [playerStats];
}

typedef $$PlayerStatsTableCreateCompanionBuilder = PlayerStatsCompanion
    Function({
  Value<int> id,
  required String fullName,
  required String team,
  required String position,
  Value<int> gamePlayed,
  Value<double> pointsPerGame,
  Value<double> reboundsPerGame,
  Value<double> assistsPerGame,
  Value<double?> stealsPerGame,
  Value<double?> twoPointsPerGame,
  Value<double?> threePointsPerGame,
  Value<DateTime> lastUpdated,
});
typedef $$PlayerStatsTableUpdateCompanionBuilder = PlayerStatsCompanion
    Function({
  Value<int> id,
  Value<String> fullName,
  Value<String> team,
  Value<String> position,
  Value<int> gamePlayed,
  Value<double> pointsPerGame,
  Value<double> reboundsPerGame,
  Value<double> assistsPerGame,
  Value<double?> stealsPerGame,
  Value<double?> twoPointsPerGame,
  Value<double?> threePointsPerGame,
  Value<DateTime> lastUpdated,
});

class $$PlayerStatsTableFilterComposer
    extends Composer<_$AppDatabase, $PlayerStatsTable> {
  $$PlayerStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get team => $composableBuilder(
      column: $table.team, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get gamePlayed => $composableBuilder(
      column: $table.gamePlayed, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get pointsPerGame => $composableBuilder(
      column: $table.pointsPerGame, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get reboundsPerGame => $composableBuilder(
      column: $table.reboundsPerGame,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get assistsPerGame => $composableBuilder(
      column: $table.assistsPerGame,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get stealsPerGame => $composableBuilder(
      column: $table.stealsPerGame, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get twoPointsPerGame => $composableBuilder(
      column: $table.twoPointsPerGame,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get threePointsPerGame => $composableBuilder(
      column: $table.threePointsPerGame,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$PlayerStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayerStatsTable> {
  $$PlayerStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get team => $composableBuilder(
      column: $table.team, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get gamePlayed => $composableBuilder(
      column: $table.gamePlayed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get pointsPerGame => $composableBuilder(
      column: $table.pointsPerGame,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get reboundsPerGame => $composableBuilder(
      column: $table.reboundsPerGame,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get assistsPerGame => $composableBuilder(
      column: $table.assistsPerGame,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get stealsPerGame => $composableBuilder(
      column: $table.stealsPerGame,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get twoPointsPerGame => $composableBuilder(
      column: $table.twoPointsPerGame,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get threePointsPerGame => $composableBuilder(
      column: $table.threePointsPerGame,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$PlayerStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayerStatsTable> {
  $$PlayerStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get team =>
      $composableBuilder(column: $table.team, builder: (column) => column);

  GeneratedColumn<String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<int> get gamePlayed => $composableBuilder(
      column: $table.gamePlayed, builder: (column) => column);

  GeneratedColumn<double> get pointsPerGame => $composableBuilder(
      column: $table.pointsPerGame, builder: (column) => column);

  GeneratedColumn<double> get reboundsPerGame => $composableBuilder(
      column: $table.reboundsPerGame, builder: (column) => column);

  GeneratedColumn<double> get assistsPerGame => $composableBuilder(
      column: $table.assistsPerGame, builder: (column) => column);

  GeneratedColumn<double> get stealsPerGame => $composableBuilder(
      column: $table.stealsPerGame, builder: (column) => column);

  GeneratedColumn<double> get twoPointsPerGame => $composableBuilder(
      column: $table.twoPointsPerGame, builder: (column) => column);

  GeneratedColumn<double> get threePointsPerGame => $composableBuilder(
      column: $table.threePointsPerGame, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$PlayerStatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlayerStatsTable,
    PlayerStat,
    $$PlayerStatsTableFilterComposer,
    $$PlayerStatsTableOrderingComposer,
    $$PlayerStatsTableAnnotationComposer,
    $$PlayerStatsTableCreateCompanionBuilder,
    $$PlayerStatsTableUpdateCompanionBuilder,
    (PlayerStat, BaseReferences<_$AppDatabase, $PlayerStatsTable, PlayerStat>),
    PlayerStat,
    PrefetchHooks Function()> {
  $$PlayerStatsTableTableManager(_$AppDatabase db, $PlayerStatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayerStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayerStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayerStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> team = const Value.absent(),
            Value<String> position = const Value.absent(),
            Value<int> gamePlayed = const Value.absent(),
            Value<double> pointsPerGame = const Value.absent(),
            Value<double> reboundsPerGame = const Value.absent(),
            Value<double> assistsPerGame = const Value.absent(),
            Value<double?> stealsPerGame = const Value.absent(),
            Value<double?> twoPointsPerGame = const Value.absent(),
            Value<double?> threePointsPerGame = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
          }) =>
              PlayerStatsCompanion(
            id: id,
            fullName: fullName,
            team: team,
            position: position,
            gamePlayed: gamePlayed,
            pointsPerGame: pointsPerGame,
            reboundsPerGame: reboundsPerGame,
            assistsPerGame: assistsPerGame,
            stealsPerGame: stealsPerGame,
            twoPointsPerGame: twoPointsPerGame,
            threePointsPerGame: threePointsPerGame,
            lastUpdated: lastUpdated,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String fullName,
            required String team,
            required String position,
            Value<int> gamePlayed = const Value.absent(),
            Value<double> pointsPerGame = const Value.absent(),
            Value<double> reboundsPerGame = const Value.absent(),
            Value<double> assistsPerGame = const Value.absent(),
            Value<double?> stealsPerGame = const Value.absent(),
            Value<double?> twoPointsPerGame = const Value.absent(),
            Value<double?> threePointsPerGame = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
          }) =>
              PlayerStatsCompanion.insert(
            id: id,
            fullName: fullName,
            team: team,
            position: position,
            gamePlayed: gamePlayed,
            pointsPerGame: pointsPerGame,
            reboundsPerGame: reboundsPerGame,
            assistsPerGame: assistsPerGame,
            stealsPerGame: stealsPerGame,
            twoPointsPerGame: twoPointsPerGame,
            threePointsPerGame: threePointsPerGame,
            lastUpdated: lastUpdated,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PlayerStatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlayerStatsTable,
    PlayerStat,
    $$PlayerStatsTableFilterComposer,
    $$PlayerStatsTableOrderingComposer,
    $$PlayerStatsTableAnnotationComposer,
    $$PlayerStatsTableCreateCompanionBuilder,
    $$PlayerStatsTableUpdateCompanionBuilder,
    (PlayerStat, BaseReferences<_$AppDatabase, $PlayerStatsTable, PlayerStat>),
    PlayerStat,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlayerStatsTableTableManager get playerStats =>
      $$PlayerStatsTableTableManager(_db, _db.playerStats);
}
