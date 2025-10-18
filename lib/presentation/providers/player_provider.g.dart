// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerRepositoryHash() => r'ab4febca60377406f71e29d78c8f3021830311ce';

/// Provider for PlayerRepository
///
/// Copied from [playerRepository].
@ProviderFor(playerRepository)
final playerRepositoryProvider = AutoDisposeProvider<PlayerRepository>.internal(
  playerRepository,
  name: r'playerRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playerRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PlayerRepositoryRef = AutoDisposeProviderRef<PlayerRepository>;
String _$allPlayerStatsHash() => r'3b7c740551e19adf7291c88f314688c6f5c88e7c';

/// Provider for all player statistics
///
/// Copied from [allPlayerStats].
@ProviderFor(allPlayerStats)
final allPlayerStatsProvider =
    AutoDisposeFutureProvider<List<PlayerStatDto>>.internal(
  allPlayerStats,
  name: r'allPlayerStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allPlayerStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllPlayerStatsRef = AutoDisposeFutureProviderRef<List<PlayerStatDto>>;
String _$searchPlayersHash() => r'b9714430398f9ec285a4a58b7284f78c6dd4daed';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provider for player search results
///
/// Copied from [searchPlayers].
@ProviderFor(searchPlayers)
const searchPlayersProvider = SearchPlayersFamily();

/// Provider for player search results
///
/// Copied from [searchPlayers].
class SearchPlayersFamily extends Family<AsyncValue<List<NbaPlayerDto>>> {
  /// Provider for player search results
  ///
  /// Copied from [searchPlayers].
  const SearchPlayersFamily();

  /// Provider for player search results
  ///
  /// Copied from [searchPlayers].
  SearchPlayersProvider call(
    String playerName,
  ) {
    return SearchPlayersProvider(
      playerName,
    );
  }

  @override
  SearchPlayersProvider getProviderOverride(
    covariant SearchPlayersProvider provider,
  ) {
    return call(
      provider.playerName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchPlayersProvider';
}

/// Provider for player search results
///
/// Copied from [searchPlayers].
class SearchPlayersProvider
    extends AutoDisposeFutureProvider<List<NbaPlayerDto>> {
  /// Provider for player search results
  ///
  /// Copied from [searchPlayers].
  SearchPlayersProvider(
    String playerName,
  ) : this._internal(
          (ref) => searchPlayers(
            ref as SearchPlayersRef,
            playerName,
          ),
          from: searchPlayersProvider,
          name: r'searchPlayersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchPlayersHash,
          dependencies: SearchPlayersFamily._dependencies,
          allTransitiveDependencies:
              SearchPlayersFamily._allTransitiveDependencies,
          playerName: playerName,
        );

  SearchPlayersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.playerName,
  }) : super.internal();

  final String playerName;

  @override
  Override overrideWith(
    FutureOr<List<NbaPlayerDto>> Function(SearchPlayersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchPlayersProvider._internal(
        (ref) => create(ref as SearchPlayersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        playerName: playerName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<NbaPlayerDto>> createElement() {
    return _SearchPlayersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchPlayersProvider && other.playerName == playerName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, playerName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchPlayersRef on AutoDisposeFutureProviderRef<List<NbaPlayerDto>> {
  /// The parameter `playerName` of this provider.
  String get playerName;
}

class _SearchPlayersProviderElement
    extends AutoDisposeFutureProviderElement<List<NbaPlayerDto>>
    with SearchPlayersRef {
  _SearchPlayersProviderElement(super.provider);

  @override
  String get playerName => (origin as SearchPlayersProvider).playerName;
}

String _$playerStatsByNameHash() => r'2a584e9248fed62b121d3fee4fa1cda7743dccc4';

/// Provider for player stats by name
///
/// Copied from [playerStatsByName].
@ProviderFor(playerStatsByName)
const playerStatsByNameProvider = PlayerStatsByNameFamily();

/// Provider for player stats by name
///
/// Copied from [playerStatsByName].
class PlayerStatsByNameFamily extends Family<AsyncValue<List<PlayerStatDto>>> {
  /// Provider for player stats by name
  ///
  /// Copied from [playerStatsByName].
  const PlayerStatsByNameFamily();

  /// Provider for player stats by name
  ///
  /// Copied from [playerStatsByName].
  PlayerStatsByNameProvider call(
    String playerName,
  ) {
    return PlayerStatsByNameProvider(
      playerName,
    );
  }

  @override
  PlayerStatsByNameProvider getProviderOverride(
    covariant PlayerStatsByNameProvider provider,
  ) {
    return call(
      provider.playerName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'playerStatsByNameProvider';
}

/// Provider for player stats by name
///
/// Copied from [playerStatsByName].
class PlayerStatsByNameProvider
    extends AutoDisposeFutureProvider<List<PlayerStatDto>> {
  /// Provider for player stats by name
  ///
  /// Copied from [playerStatsByName].
  PlayerStatsByNameProvider(
    String playerName,
  ) : this._internal(
          (ref) => playerStatsByName(
            ref as PlayerStatsByNameRef,
            playerName,
          ),
          from: playerStatsByNameProvider,
          name: r'playerStatsByNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerStatsByNameHash,
          dependencies: PlayerStatsByNameFamily._dependencies,
          allTransitiveDependencies:
              PlayerStatsByNameFamily._allTransitiveDependencies,
          playerName: playerName,
        );

  PlayerStatsByNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.playerName,
  }) : super.internal();

  final String playerName;

  @override
  Override overrideWith(
    FutureOr<List<PlayerStatDto>> Function(PlayerStatsByNameRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerStatsByNameProvider._internal(
        (ref) => create(ref as PlayerStatsByNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        playerName: playerName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PlayerStatDto>> createElement() {
    return _PlayerStatsByNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerStatsByNameProvider && other.playerName == playerName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, playerName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlayerStatsByNameRef
    on AutoDisposeFutureProviderRef<List<PlayerStatDto>> {
  /// The parameter `playerName` of this provider.
  String get playerName;
}

class _PlayerStatsByNameProviderElement
    extends AutoDisposeFutureProviderElement<List<PlayerStatDto>>
    with PlayerStatsByNameRef {
  _PlayerStatsByNameProviderElement(super.provider);

  @override
  String get playerName => (origin as PlayerStatsByNameProvider).playerName;
}

String _$playerStatsByTeamHash() => r'094a48d81a1ed9c298caf7bfaaf05977ecc6f83e';

/// Provider for player stats by team
///
/// Copied from [playerStatsByTeam].
@ProviderFor(playerStatsByTeam)
const playerStatsByTeamProvider = PlayerStatsByTeamFamily();

/// Provider for player stats by team
///
/// Copied from [playerStatsByTeam].
class PlayerStatsByTeamFamily extends Family<AsyncValue<List<PlayerStatDto>>> {
  /// Provider for player stats by team
  ///
  /// Copied from [playerStatsByTeam].
  const PlayerStatsByTeamFamily();

  /// Provider for player stats by team
  ///
  /// Copied from [playerStatsByTeam].
  PlayerStatsByTeamProvider call(
    String teamName,
  ) {
    return PlayerStatsByTeamProvider(
      teamName,
    );
  }

  @override
  PlayerStatsByTeamProvider getProviderOverride(
    covariant PlayerStatsByTeamProvider provider,
  ) {
    return call(
      provider.teamName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'playerStatsByTeamProvider';
}

/// Provider for player stats by team
///
/// Copied from [playerStatsByTeam].
class PlayerStatsByTeamProvider
    extends AutoDisposeFutureProvider<List<PlayerStatDto>> {
  /// Provider for player stats by team
  ///
  /// Copied from [playerStatsByTeam].
  PlayerStatsByTeamProvider(
    String teamName,
  ) : this._internal(
          (ref) => playerStatsByTeam(
            ref as PlayerStatsByTeamRef,
            teamName,
          ),
          from: playerStatsByTeamProvider,
          name: r'playerStatsByTeamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerStatsByTeamHash,
          dependencies: PlayerStatsByTeamFamily._dependencies,
          allTransitiveDependencies:
              PlayerStatsByTeamFamily._allTransitiveDependencies,
          teamName: teamName,
        );

  PlayerStatsByTeamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.teamName,
  }) : super.internal();

  final String teamName;

  @override
  Override overrideWith(
    FutureOr<List<PlayerStatDto>> Function(PlayerStatsByTeamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerStatsByTeamProvider._internal(
        (ref) => create(ref as PlayerStatsByTeamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        teamName: teamName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PlayerStatDto>> createElement() {
    return _PlayerStatsByTeamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerStatsByTeamProvider && other.teamName == teamName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, teamName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlayerStatsByTeamRef
    on AutoDisposeFutureProviderRef<List<PlayerStatDto>> {
  /// The parameter `teamName` of this provider.
  String get teamName;
}

class _PlayerStatsByTeamProviderElement
    extends AutoDisposeFutureProviderElement<List<PlayerStatDto>>
    with PlayerStatsByTeamRef {
  _PlayerStatsByTeamProviderElement(super.provider);

  @override
  String get teamName => (origin as PlayerStatsByTeamProvider).teamName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
