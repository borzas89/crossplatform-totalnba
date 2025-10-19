import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection.config.dart';

/// Global service locator instance
final getIt = GetIt.instance;

/// Initialize dependency injection
/// Call this in main() before runApp()
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  // Register SharedPreferences manually
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);

  // Initialize other dependencies
  getIt.init();
}
