// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/local/app_database.dart' as _i293;
import '../../data/network/api_client.dart' as _i927;
import '../../data/repositories/player_repository_impl.dart' as _i370;
import '../../data/repositories/prediction_repository_impl.dart' as _i144;
import '../../data/repositories/result_repository_impl.dart' as _i667;
import '../../domain/repositories/player_repository.dart' as _i857;
import '../../domain/repositories/prediction_repository.dart' as _i194;
import '../../domain/repositories/result_repository.dart' as _i327;
import '../../domain/services/player_sync_service.dart' as _i480;
import '../../domain/services/settings_service.dart' as _i184;
import 'database_module.dart' as _i384;
import 'network_module.dart' as _i567;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final databaseModule = _$DatabaseModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i293.AppDatabase>(() => databaseModule.database);
    gh.lazySingleton<_i974.Logger>(() => networkModule.provideLogger());
    gh.factory<_i184.SettingsService>(
        () => _i184.SettingsService(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i361.Dio>(
        () => networkModule.provideDio(gh<_i974.Logger>()));
    gh.factory<_i927.ApiClient>(() => _i927.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i327.ResultRepository>(() => _i667.ResultRepositoryImpl(
          gh<_i927.ApiClient>(),
          gh<_i974.Logger>(),
        ));
    gh.factory<_i194.PredictionRepository>(() => _i144.PredictionRepositoryImpl(
          gh<_i927.ApiClient>(),
          gh<_i974.Logger>(),
        ));
    gh.factory<_i857.PlayerRepository>(() => _i370.PlayerRepositoryImpl(
          gh<_i927.ApiClient>(),
          gh<_i293.AppDatabase>(),
          gh<_i974.Logger>(),
        ));
    gh.factory<_i480.PlayerSyncService>(() => _i480.PlayerSyncService(
          gh<_i857.PlayerRepository>(),
          gh<_i974.Logger>(),
        ));
    return this;
  }
}

class _$DatabaseModule extends _i384.DatabaseModule {}

class _$NetworkModule extends _i567.NetworkModule {}
