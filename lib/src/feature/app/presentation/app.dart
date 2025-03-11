import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:kutim/src/core/containers/repository_storage.dart';
import 'package:kutim/src/core/presentation/scopes/repository_scope.dart';
import 'package:kutim/src/core/utils/layout/window_size.dart';
import 'package:kutim/src/feature/app/presentation/material_context.dart';
import 'package:kutim/src/feature/app/initialization/logic/composition_root.dart';
import 'package:kutim/src/feature/app/initialization/widget/dependencies_scope.dart';
import 'package:kutim/src/feature/settings/widget/settings_scope.dart';

/// {@template app}
/// [App] is an entry point to the application.
///
/// If a scope doesn't depend on any inherited widget returned by
/// [MaterialApp] or [WidgetsApp], like [Directionality] or [Theme],
/// and it should be available in the whole application, it can be
/// placed here.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({required this.result, super.key});

  /// The result from the [CompositionRoot].
  final CompositionResult result;

  @override
  Widget build(BuildContext context) => DefaultAssetBundle(
        bundle: SentryAssetBundle(),
        child: DependenciesScope(
          dependencies: result.dependencies,
          child: RepositoryScope(
            create: (context) => RepositoryStorage(
              sharedPreferences: result.dependencies.sharedPreferences,
              packageInfo: result.dependencies.packageInfo,
              appSettingsDatasource: result.dependencies.appSettingsDatasource,
            ),
            child: const SettingsScope(
              child: WindowSizeScope(
                child: MaterialContext(),
              ),
            ),
          ),
        ),
      );
}
