import 'package:injectable/injectable.dart';
import '../../data/local/app_database.dart';

/// Database module for dependency injection
@module
abstract class DatabaseModule {
  @lazySingleton
  AppDatabase get database => AppDatabase();
}
