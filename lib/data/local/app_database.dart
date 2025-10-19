import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../models/player_stat_dto.dart';

part 'app_database.g.dart';

/// Player stats table definition
class PlayerStats extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text().withLength(min: 1, max: 100)();
  TextColumn get team => text().withLength(min: 1, max: 50)();
  TextColumn get position => text().withLength(min: 1, max: 10)();
  IntColumn get gamePlayed => integer().withDefault(const Constant(0))();
  RealColumn get pointsPerGame => real().withDefault(const Constant(0.0))();
  RealColumn get reboundsPerGame => real().withDefault(const Constant(0.0))();
  RealColumn get assistsPerGame => real().withDefault(const Constant(0.0))();
  RealColumn get stealsPerGame => real().nullable()();
  RealColumn get twoPointsPerGame => real().nullable()();
  RealColumn get threePointsPerGame => real().nullable()();
  DateTimeColumn get lastUpdated => dateTime().withDefault(currentDateAndTime)();
}

/// Drift database for TotalNBA app
@DriftDatabase(tables: [PlayerStats])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // ===== Player Stats Operations =====

  /// Insert or update a player stat
  Future<int> insertPlayerStat(PlayerStatsCompanion playerStat) {
    return into(playerStats).insert(
      playerStat,
      onConflict: DoUpdate((old) => playerStat),
    );
  }

  /// Insert or update multiple player stats
  Future<void> insertPlayerStats(List<PlayerStatDto> stats) async {
    await batch((batch) {
      batch.insertAll(
        playerStats,
        stats.map((stat) => PlayerStatsCompanion.insert(
              fullName: stat.fullName,
              team: stat.team,
              position: stat.position,
              gamePlayed: Value(stat.gamePlayed),
              pointsPerGame: Value(stat.pointsPerGame),
              reboundsPerGame: Value(stat.reboundsPerGame),
              assistsPerGame: Value(stat.assistsPerGame),
              stealsPerGame: Value(stat.stealsPerGame),
              twoPointsPerGame: Value(stat.twoPointsPerGame),
              threePointsPerGame: Value(stat.threePointsPerGame),
            )),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  /// Get all player stats
  Future<List<PlayerStat>> getAllPlayerStats() {
    return select(playerStats).get();
  }

  /// Search player stats by name or team
  Future<List<PlayerStat>> searchPlayerStats(String query) {
    final searchQuery = '%${query.toLowerCase()}%';
    return (select(playerStats)
          ..where((tbl) =>
              tbl.fullName.lower().like(searchQuery) |
              tbl.team.lower().like(searchQuery) |
              tbl.position.lower().like(searchQuery)))
        .get();
  }

  /// Get player stats by name
  Future<List<PlayerStat>> getPlayerStatsByName(String name) {
    return (select(playerStats)
          ..where((tbl) => tbl.fullName.lower().contains(name.toLowerCase())))
        .get();
  }

  /// Get player stats by team
  Future<List<PlayerStat>> getPlayerStatsByTeam(String team) {
    return (select(playerStats)
          ..where((tbl) => tbl.team.lower().equals(team.toLowerCase())))
        .get();
  }

  /// Clear all player stats
  Future<int> clearAllPlayerStats() {
    return delete(playerStats).go();
  }

  /// Get count of player stats
  Future<int> getPlayerStatsCount() async {
    final countExp = playerStats.id.count();
    final query = selectOnly(playerStats)..addColumns([countExp]);
    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }
}

/// Open database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'totalnba.db'));
    return NativeDatabase(file);
  });
}
