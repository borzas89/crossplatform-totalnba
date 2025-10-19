import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../repositories/player_repository.dart';

/// Service to sync player stats from API to local database
@injectable
class PlayerSyncService {
  final PlayerRepository _playerRepository;
  final Logger _logger;

  PlayerSyncService(this._playerRepository, this._logger);

  /// Sync all player stats from API to local database
  /// This should be called on app startup
  Future<void> syncPlayerStats() async {
    try {
      _logger.i('Starting player stats sync');
      final stats = await _playerRepository.getAllPlayerStats();
      _logger.i('Successfully synced ${stats.length} player stats');
    } catch (e, stackTrace) {
      _logger.e('Error syncing player stats', error: e, stackTrace: stackTrace);
      // Don't rethrow - app should continue even if sync fails
    }
  }
}
