import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Интерфейс для имплементации зависимостей
abstract class IDependenciesStorage {
  /// External
  SharedPreferences get sharedPreferences;
  PackageInfo get packageInfo;

  /// Internal
  // IAuthDao get authDao;

  /// Network
  // RestClient get restClient;
  // RestClient get portalRestClient;
  // RestClient get marketplaceRestClient;
  // RestClient get gamificationRestClient;

  void close();
  void clear();
}

class DependenciesStorage implements IDependenciesStorage {
  DependenciesStorage({
    required SharedPreferences sharedPreferences,
    required PackageInfo packageInfo,
  })  : _sharedPreferences = sharedPreferences,
        _packageInfo = packageInfo;
  final SharedPreferences _sharedPreferences;
  final PackageInfo _packageInfo;

  Dio? _dio;

  @override
  Future<void> close() async {
    _dio?.close();
  }

  @override
  void clear() {
    _dio = null;
  }

  // @override
  // Dio get dio => _dio ??= DioModule.configureDio(
  //       authDao: authDao,
  //       settings: SettingsDao(sharedPreferences: sharedPreferences),
  //       packageInfo: packageInfo,
  //     );

  // @override
  // Dio get portalDio => _portalDio ??= DioModule.configurePortalDio(
  //       authDao: authDao,
  //       settings: SettingsDao(sharedPreferences: sharedPreferences),
  //       packageInfo: packageInfo,
  //     );

  @override
  SharedPreferences get sharedPreferences => _sharedPreferences;

  @override
  PackageInfo get packageInfo => _packageInfo;
}
