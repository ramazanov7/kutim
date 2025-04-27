import 'dart:ui';

import 'package:clock/clock.dart';
import 'package:kutim/src/feature/app/initialization/model/dependencies_container.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kutim/src/core/constant/config.dart';
import 'package:kutim/src/core/constant/localization/localization.dart';
import 'package:kutim/src/core/utils/refined_logger.dart';
import 'package:kutim/src/feature/app/logic/tracking_manager.dart';
import 'package:kutim/src/feature/settings/bloc/app_settings_bloc.dart';
import 'package:kutim/src/feature/settings/data/app_settings_datasource.dart';
import 'package:kutim/src/feature/settings/data/app_settings_repository.dart';
import 'package:kutim/src/feature/settings/model/app_settings.dart';

/// A place where all dependencies are initialized.
///
/// Composition of dependencies is a process of creating and configuring
/// instances of classes that are required for the application to work.
///
/// It is a good practice to keep all dependencies in one place to make it
/// easier to manage them and to ensure that they are initialized only once.
final class CompositionRoot {
  /// {@macro composition_root}
  const CompositionRoot(this.config, this.logger);

  /// Application configuration
  final Config config;

  /// Logger used to log information during composition process.
  final RefinedLogger logger;

  /// Composes dependencies and returns result of composition.
  Future<CompositionResult> compose() async {
    final stopwatch = clock.stopwatch()..start();

    logger.info('Initializing dependencies...');
    // initialize dependencies
    final dependencies = await DependenciesFactory(config, logger).create();
    logger.info('Dependencies initialized');

    stopwatch.stop();
    final result = CompositionResult(
      dependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );

    return result;
  }
}

/// Factory that creates an instance of [T].
abstract class Factory<T> {
  /// Creates an instance of [T].
  T create();
}

/// Factory that creates an instance of [T] asynchronously.
abstract class AsyncFactory<T> {
  /// Creates an instance of [T].
  Future<T> create();
}

/// Factory that creates an instance of [DependenciesContainer].
class DependenciesFactory extends AsyncFactory<DependenciesContainer> {
  DependenciesFactory(this.config, this.logger);

  /// Application configuration
  final Config config;

  /// Logger used to log information during composition process.
  final RefinedLogger logger;

  @override
  Future<DependenciesContainer> create() async {
    final sharedPreferences = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
    final packageInfo = await PackageInfo.fromPlatform();
    final errorTrackingManager = await ErrorTrackingManagerFactory(config, logger).create();
    final sharedPreferencesAsync = SharedPreferencesAsync();
    final appSettingsDatasource = AppSettingsDatasourceImpl(sharedPreferences: sharedPreferencesAsync);
    final settingsBloc = await SettingsBlocFactory(appSettingsDatasource).create();

    return DependenciesContainer(
      appSettingsBloc: settingsBloc,
      packageInfo: packageInfo,
      errorTrackingManager: errorTrackingManager,
      sharedPreferences: sharedPreferences,
      appSettingsDatasource: appSettingsDatasource,
    );
  }
}

/// Factory that creates an instance of [ErrorTrackingManager].
class ErrorTrackingManagerFactory extends AsyncFactory<ErrorTrackingManager> {
  ErrorTrackingManagerFactory(this.config, this.logger);

  /// Application configuration
  final Config config;

  /// Logger used to log information during composition process.
  final RefinedLogger logger;

  @override
  Future<ErrorTrackingManager> create() async {
    final errorTrackingManager = SentryTrackingManager(
      logger,
      sentryDsn: config.sentryDsn,
      environment: config.environment.value,
    );

    if (config.enableSentry) {
      await errorTrackingManager.enableReporting();
    }

    return errorTrackingManager;
  }
}

/// Factory that creates an instance of [AppSettingsBloc].
class SettingsBlocFactory extends AsyncFactory<AppSettingsBloc> {
  SettingsBlocFactory(this.datasource);

  /// App settings data source instance
  final AppSettingsDatasource datasource;

  @override
  Future<AppSettingsBloc> create() async {
    final appSettingsRepository = AppSettingsRepositoryImpl(
      datasource: datasource,
    );

    final appSettings = await appSettingsRepository.getAppSettings();

    // Localization.load(appSettings?.locale ?? const Locale('kk'));

    final initialState = AppSettingsState.idle(appSettings: appSettings);

    return AppSettingsBloc(
      appSettingsRepository: appSettingsRepository,
      initialState: initialState,
    );
  }
}

/// Result of composition
final class CompositionResult {
  const CompositionResult({
    required this.dependencies,
    required this.msSpent,
  });

  /// The dependencies container
  final DependenciesContainer dependencies;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => '$CompositionResult('
      'dependencies: $dependencies, '
      'msSpent: $msSpent'
      ')';
}
