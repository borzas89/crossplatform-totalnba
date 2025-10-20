// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overall_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$matchOverallsHash() => r'8f5b428e1db0e35e3991bd5b58dcac3ff3ba3d6e';

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

/// Provider for fetching overall statistics for both teams in a match
/// Uses the /api/overalls endpoint with FULL team names
/// Example: homeName="Philadelphia 76ers", awayName="New York Knicks"
///
/// Copied from [matchOveralls].
@ProviderFor(matchOveralls)
const matchOverallsProvider = MatchOverallsFamily();

/// Provider for fetching overall statistics for both teams in a match
/// Uses the /api/overalls endpoint with FULL team names
/// Example: homeName="Philadelphia 76ers", awayName="New York Knicks"
///
/// Copied from [matchOveralls].
class MatchOverallsFamily extends Family<AsyncValue<Map<String, OverallDto>>> {
  /// Provider for fetching overall statistics for both teams in a match
  /// Uses the /api/overalls endpoint with FULL team names
  /// Example: homeName="Philadelphia 76ers", awayName="New York Knicks"
  ///
  /// Copied from [matchOveralls].
  const MatchOverallsFamily();

  /// Provider for fetching overall statistics for both teams in a match
  /// Uses the /api/overalls endpoint with FULL team names
  /// Example: homeName="Philadelphia 76ers", awayName="New York Knicks"
  ///
  /// Copied from [matchOveralls].
  MatchOverallsProvider call(
    String homeTeamName,
    String awayTeamName,
  ) {
    return MatchOverallsProvider(
      homeTeamName,
      awayTeamName,
    );
  }

  @override
  MatchOverallsProvider getProviderOverride(
    covariant MatchOverallsProvider provider,
  ) {
    return call(
      provider.homeTeamName,
      provider.awayTeamName,
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
  String? get name => r'matchOverallsProvider';
}

/// Provider for fetching overall statistics for both teams in a match
/// Uses the /api/overalls endpoint with FULL team names
/// Example: homeName="Philadelphia 76ers", awayName="New York Knicks"
///
/// Copied from [matchOveralls].
class MatchOverallsProvider
    extends AutoDisposeFutureProvider<Map<String, OverallDto>> {
  /// Provider for fetching overall statistics for both teams in a match
  /// Uses the /api/overalls endpoint with FULL team names
  /// Example: homeName="Philadelphia 76ers", awayName="New York Knicks"
  ///
  /// Copied from [matchOveralls].
  MatchOverallsProvider(
    String homeTeamName,
    String awayTeamName,
  ) : this._internal(
          (ref) => matchOveralls(
            ref as MatchOverallsRef,
            homeTeamName,
            awayTeamName,
          ),
          from: matchOverallsProvider,
          name: r'matchOverallsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$matchOverallsHash,
          dependencies: MatchOverallsFamily._dependencies,
          allTransitiveDependencies:
              MatchOverallsFamily._allTransitiveDependencies,
          homeTeamName: homeTeamName,
          awayTeamName: awayTeamName,
        );

  MatchOverallsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.homeTeamName,
    required this.awayTeamName,
  }) : super.internal();

  final String homeTeamName;
  final String awayTeamName;

  @override
  Override overrideWith(
    FutureOr<Map<String, OverallDto>> Function(MatchOverallsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MatchOverallsProvider._internal(
        (ref) => create(ref as MatchOverallsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        homeTeamName: homeTeamName,
        awayTeamName: awayTeamName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, OverallDto>> createElement() {
    return _MatchOverallsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchOverallsProvider &&
        other.homeTeamName == homeTeamName &&
        other.awayTeamName == awayTeamName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, homeTeamName.hashCode);
    hash = _SystemHash.combine(hash, awayTeamName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MatchOverallsRef
    on AutoDisposeFutureProviderRef<Map<String, OverallDto>> {
  /// The parameter `homeTeamName` of this provider.
  String get homeTeamName;

  /// The parameter `awayTeamName` of this provider.
  String get awayTeamName;
}

class _MatchOverallsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, OverallDto>>
    with MatchOverallsRef {
  _MatchOverallsProviderElement(super.provider);

  @override
  String get homeTeamName => (origin as MatchOverallsProvider).homeTeamName;
  @override
  String get awayTeamName => (origin as MatchOverallsProvider).awayTeamName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
