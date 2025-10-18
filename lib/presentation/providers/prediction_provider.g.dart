// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$predictionRepositoryHash() =>
    r'3b7833f82e2122c5bc72591b365ee65778a92e66';

/// Provider for PredictionRepository
///
/// Copied from [predictionRepository].
@ProviderFor(predictionRepository)
final predictionRepositoryProvider =
    AutoDisposeProvider<PredictionRepository>.internal(
  predictionRepository,
  name: r'predictionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$predictionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PredictionRepositoryRef = AutoDisposeProviderRef<PredictionRepository>;
String _$allPredictionsHash() => r'6c328d65c0979540d0c7ed21454e147b249e334b';

/// Provider for all predictions
/// Auto-caches the result and only refetches when invalidated
///
/// Copied from [allPredictions].
@ProviderFor(allPredictions)
final allPredictionsProvider =
    AutoDisposeFutureProvider<List<PredictedMatchDto>>.internal(
  allPredictions,
  name: r'allPredictionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allPredictionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllPredictionsRef
    = AutoDisposeFutureProviderRef<List<PredictedMatchDto>>;
String _$predictionsByWeekHash() => r'd6ac81c7aada0c4d72d2901cfa39fb965916161c';

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

/// Provider for predictions by week
///
/// Copied from [predictionsByWeek].
@ProviderFor(predictionsByWeek)
const predictionsByWeekProvider = PredictionsByWeekFamily();

/// Provider for predictions by week
///
/// Copied from [predictionsByWeek].
class PredictionsByWeekFamily
    extends Family<AsyncValue<List<PredictedMatchDto>>> {
  /// Provider for predictions by week
  ///
  /// Copied from [predictionsByWeek].
  const PredictionsByWeekFamily();

  /// Provider for predictions by week
  ///
  /// Copied from [predictionsByWeek].
  PredictionsByWeekProvider call(
    int week,
  ) {
    return PredictionsByWeekProvider(
      week,
    );
  }

  @override
  PredictionsByWeekProvider getProviderOverride(
    covariant PredictionsByWeekProvider provider,
  ) {
    return call(
      provider.week,
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
  String? get name => r'predictionsByWeekProvider';
}

/// Provider for predictions by week
///
/// Copied from [predictionsByWeek].
class PredictionsByWeekProvider
    extends AutoDisposeFutureProvider<List<PredictedMatchDto>> {
  /// Provider for predictions by week
  ///
  /// Copied from [predictionsByWeek].
  PredictionsByWeekProvider(
    int week,
  ) : this._internal(
          (ref) => predictionsByWeek(
            ref as PredictionsByWeekRef,
            week,
          ),
          from: predictionsByWeekProvider,
          name: r'predictionsByWeekProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$predictionsByWeekHash,
          dependencies: PredictionsByWeekFamily._dependencies,
          allTransitiveDependencies:
              PredictionsByWeekFamily._allTransitiveDependencies,
          week: week,
        );

  PredictionsByWeekProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.week,
  }) : super.internal();

  final int week;

  @override
  Override overrideWith(
    FutureOr<List<PredictedMatchDto>> Function(PredictionsByWeekRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PredictionsByWeekProvider._internal(
        (ref) => create(ref as PredictionsByWeekRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        week: week,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PredictedMatchDto>> createElement() {
    return _PredictionsByWeekProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PredictionsByWeekProvider && other.week == week;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, week.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PredictionsByWeekRef
    on AutoDisposeFutureProviderRef<List<PredictedMatchDto>> {
  /// The parameter `week` of this provider.
  int get week;
}

class _PredictionsByWeekProviderElement
    extends AutoDisposeFutureProviderElement<List<PredictedMatchDto>>
    with PredictionsByWeekRef {
  _PredictionsByWeekProviderElement(super.provider);

  @override
  int get week => (origin as PredictionsByWeekProvider).week;
}

String _$predictionsByDayHash() => r'4e18a34e25cd9839368a8ff1465267eb17ea5a93';

/// Provider for predictions by day
///
/// Copied from [predictionsByDay].
@ProviderFor(predictionsByDay)
const predictionsByDayProvider = PredictionsByDayFamily();

/// Provider for predictions by day
///
/// Copied from [predictionsByDay].
class PredictionsByDayFamily
    extends Family<AsyncValue<List<PredictedMatchDto>>> {
  /// Provider for predictions by day
  ///
  /// Copied from [predictionsByDay].
  const PredictionsByDayFamily();

  /// Provider for predictions by day
  ///
  /// Copied from [predictionsByDay].
  PredictionsByDayProvider call(
    String day,
  ) {
    return PredictionsByDayProvider(
      day,
    );
  }

  @override
  PredictionsByDayProvider getProviderOverride(
    covariant PredictionsByDayProvider provider,
  ) {
    return call(
      provider.day,
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
  String? get name => r'predictionsByDayProvider';
}

/// Provider for predictions by day
///
/// Copied from [predictionsByDay].
class PredictionsByDayProvider
    extends AutoDisposeFutureProvider<List<PredictedMatchDto>> {
  /// Provider for predictions by day
  ///
  /// Copied from [predictionsByDay].
  PredictionsByDayProvider(
    String day,
  ) : this._internal(
          (ref) => predictionsByDay(
            ref as PredictionsByDayRef,
            day,
          ),
          from: predictionsByDayProvider,
          name: r'predictionsByDayProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$predictionsByDayHash,
          dependencies: PredictionsByDayFamily._dependencies,
          allTransitiveDependencies:
              PredictionsByDayFamily._allTransitiveDependencies,
          day: day,
        );

  PredictionsByDayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.day,
  }) : super.internal();

  final String day;

  @override
  Override overrideWith(
    FutureOr<List<PredictedMatchDto>> Function(PredictionsByDayRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PredictionsByDayProvider._internal(
        (ref) => create(ref as PredictionsByDayRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        day: day,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PredictedMatchDto>> createElement() {
    return _PredictionsByDayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PredictionsByDayProvider && other.day == day;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, day.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PredictionsByDayRef
    on AutoDisposeFutureProviderRef<List<PredictedMatchDto>> {
  /// The parameter `day` of this provider.
  String get day;
}

class _PredictionsByDayProviderElement
    extends AutoDisposeFutureProviderElement<List<PredictedMatchDto>>
    with PredictionsByDayRef {
  _PredictionsByDayProviderElement(super.provider);

  @override
  String get day => (origin as PredictionsByDayProvider).day;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
