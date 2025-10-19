// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$resultRepositoryHash() => r'f223375488f48217880a8516a5ba1503c20a5900';

/// Provider for ResultRepository
///
/// Copied from [resultRepository].
@ProviderFor(resultRepository)
final resultRepositoryProvider = AutoDisposeProvider<ResultRepository>.internal(
  resultRepository,
  name: r'resultRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$resultRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ResultRepositoryRef = AutoDisposeProviderRef<ResultRepository>;
String _$resultsByTeamHash() => r'66311b20adb8e044f8d57bb696229c2c99df000d';

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

/// Provider for team results
/// Takes a team name parameter and fetches all results for that team
///
/// Copied from [resultsByTeam].
@ProviderFor(resultsByTeam)
const resultsByTeamProvider = ResultsByTeamFamily();

/// Provider for team results
/// Takes a team name parameter and fetches all results for that team
///
/// Copied from [resultsByTeam].
class ResultsByTeamFamily extends Family<AsyncValue<List<ResultDto>>> {
  /// Provider for team results
  /// Takes a team name parameter and fetches all results for that team
  ///
  /// Copied from [resultsByTeam].
  const ResultsByTeamFamily();

  /// Provider for team results
  /// Takes a team name parameter and fetches all results for that team
  ///
  /// Copied from [resultsByTeam].
  ResultsByTeamProvider call(
    String teamName,
  ) {
    return ResultsByTeamProvider(
      teamName,
    );
  }

  @override
  ResultsByTeamProvider getProviderOverride(
    covariant ResultsByTeamProvider provider,
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
  String? get name => r'resultsByTeamProvider';
}

/// Provider for team results
/// Takes a team name parameter and fetches all results for that team
///
/// Copied from [resultsByTeam].
class ResultsByTeamProvider extends AutoDisposeFutureProvider<List<ResultDto>> {
  /// Provider for team results
  /// Takes a team name parameter and fetches all results for that team
  ///
  /// Copied from [resultsByTeam].
  ResultsByTeamProvider(
    String teamName,
  ) : this._internal(
          (ref) => resultsByTeam(
            ref as ResultsByTeamRef,
            teamName,
          ),
          from: resultsByTeamProvider,
          name: r'resultsByTeamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resultsByTeamHash,
          dependencies: ResultsByTeamFamily._dependencies,
          allTransitiveDependencies:
              ResultsByTeamFamily._allTransitiveDependencies,
          teamName: teamName,
        );

  ResultsByTeamProvider._internal(
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
    FutureOr<List<ResultDto>> Function(ResultsByTeamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResultsByTeamProvider._internal(
        (ref) => create(ref as ResultsByTeamRef),
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
  AutoDisposeFutureProviderElement<List<ResultDto>> createElement() {
    return _ResultsByTeamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResultsByTeamProvider && other.teamName == teamName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, teamName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ResultsByTeamRef on AutoDisposeFutureProviderRef<List<ResultDto>> {
  /// The parameter `teamName` of this provider.
  String get teamName;
}

class _ResultsByTeamProviderElement
    extends AutoDisposeFutureProviderElement<List<ResultDto>>
    with ResultsByTeamRef {
  _ResultsByTeamProviderElement(super.provider);

  @override
  String get teamName => (origin as ResultsByTeamProvider).teamName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
