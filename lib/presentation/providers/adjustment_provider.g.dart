// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adjustment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$matchAdjustmentsHash() => r'54317cb6272d0bb19df03aec67b8bbf481235ed0';

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

/// Provider for fetching adjustments for both teams in a match (by team aliases)
/// Uses the /api/adjustments endpoint with teamName query parameter
/// Makes TWO separate API calls (one for each team) since the endpoint only accepts one team at a time
///
/// Copied from [matchAdjustments].
@ProviderFor(matchAdjustments)
const matchAdjustmentsProvider = MatchAdjustmentsFamily();

/// Provider for fetching adjustments for both teams in a match (by team aliases)
/// Uses the /api/adjustments endpoint with teamName query parameter
/// Makes TWO separate API calls (one for each team) since the endpoint only accepts one team at a time
///
/// Copied from [matchAdjustments].
class MatchAdjustmentsFamily
    extends Family<AsyncValue<Map<String, AdjustmentDto>>> {
  /// Provider for fetching adjustments for both teams in a match (by team aliases)
  /// Uses the /api/adjustments endpoint with teamName query parameter
  /// Makes TWO separate API calls (one for each team) since the endpoint only accepts one team at a time
  ///
  /// Copied from [matchAdjustments].
  const MatchAdjustmentsFamily();

  /// Provider for fetching adjustments for both teams in a match (by team aliases)
  /// Uses the /api/adjustments endpoint with teamName query parameter
  /// Makes TWO separate API calls (one for each team) since the endpoint only accepts one team at a time
  ///
  /// Copied from [matchAdjustments].
  MatchAdjustmentsProvider call(
    String homeTeamAlias,
    String awayTeamAlias,
  ) {
    return MatchAdjustmentsProvider(
      homeTeamAlias,
      awayTeamAlias,
    );
  }

  @override
  MatchAdjustmentsProvider getProviderOverride(
    covariant MatchAdjustmentsProvider provider,
  ) {
    return call(
      provider.homeTeamAlias,
      provider.awayTeamAlias,
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
  String? get name => r'matchAdjustmentsProvider';
}

/// Provider for fetching adjustments for both teams in a match (by team aliases)
/// Uses the /api/adjustments endpoint with teamName query parameter
/// Makes TWO separate API calls (one for each team) since the endpoint only accepts one team at a time
///
/// Copied from [matchAdjustments].
class MatchAdjustmentsProvider
    extends AutoDisposeFutureProvider<Map<String, AdjustmentDto>> {
  /// Provider for fetching adjustments for both teams in a match (by team aliases)
  /// Uses the /api/adjustments endpoint with teamName query parameter
  /// Makes TWO separate API calls (one for each team) since the endpoint only accepts one team at a time
  ///
  /// Copied from [matchAdjustments].
  MatchAdjustmentsProvider(
    String homeTeamAlias,
    String awayTeamAlias,
  ) : this._internal(
          (ref) => matchAdjustments(
            ref as MatchAdjustmentsRef,
            homeTeamAlias,
            awayTeamAlias,
          ),
          from: matchAdjustmentsProvider,
          name: r'matchAdjustmentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$matchAdjustmentsHash,
          dependencies: MatchAdjustmentsFamily._dependencies,
          allTransitiveDependencies:
              MatchAdjustmentsFamily._allTransitiveDependencies,
          homeTeamAlias: homeTeamAlias,
          awayTeamAlias: awayTeamAlias,
        );

  MatchAdjustmentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.homeTeamAlias,
    required this.awayTeamAlias,
  }) : super.internal();

  final String homeTeamAlias;
  final String awayTeamAlias;

  @override
  Override overrideWith(
    FutureOr<Map<String, AdjustmentDto>> Function(MatchAdjustmentsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MatchAdjustmentsProvider._internal(
        (ref) => create(ref as MatchAdjustmentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        homeTeamAlias: homeTeamAlias,
        awayTeamAlias: awayTeamAlias,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, AdjustmentDto>> createElement() {
    return _MatchAdjustmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchAdjustmentsProvider &&
        other.homeTeamAlias == homeTeamAlias &&
        other.awayTeamAlias == awayTeamAlias;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, homeTeamAlias.hashCode);
    hash = _SystemHash.combine(hash, awayTeamAlias.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MatchAdjustmentsRef
    on AutoDisposeFutureProviderRef<Map<String, AdjustmentDto>> {
  /// The parameter `homeTeamAlias` of this provider.
  String get homeTeamAlias;

  /// The parameter `awayTeamAlias` of this provider.
  String get awayTeamAlias;
}

class _MatchAdjustmentsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, AdjustmentDto>>
    with MatchAdjustmentsRef {
  _MatchAdjustmentsProviderElement(super.provider);

  @override
  String get homeTeamAlias =>
      (origin as MatchAdjustmentsProvider).homeTeamAlias;
  @override
  String get awayTeamAlias =>
      (origin as MatchAdjustmentsProvider).awayTeamAlias;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
