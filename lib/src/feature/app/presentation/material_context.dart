import 'package:flutter/material.dart';

import 'package:kutim/src/core/constant/localization/localization.dart';

import 'package:kutim/src/core/theme/resources.dart';

import 'package:kutim/src/feature/app/presentation/widgets/app_router_builder.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';

import 'package:kutim/src/feature/settings/widget/settings_scope.dart';

/// {@template material_context}
/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
/// {@endtemplate}
class MaterialContext extends StatelessWidget {
  /// {@macro material_context}
  const MaterialContext({super.key});

  // This global key is needed for [MaterialApp]
  // to work properly when Widgets Inspector is enabled.
  // static final _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final settings = SettingsScope.settingsOf(context);
    final mediaQueryData = MediaQuery.of(context);

    return AppRouterBuilder(
      createRouter: (context) => AppRouter(),
      builder: (context, informationParser, routerDelegate, router) => MaterialApp.router(
        title: 'autohelp',
        onGenerateTitle: (context) => 'autohelp',
        routerDelegate: routerDelegate,
        routeInformationParser: informationParser,
        theme: AppTheme.light,
        darkTheme: AppTheme.light,
        // theme: theme.lightTheme,
        // darkTheme: theme.darkTheme,
        // themeMode: ThemeMode.light, // theme.mode,
        // localizationsDelegates: Localization.localizationDelegates,
        // supportedLocales: Localization.supportedLocales,
        locale: settings.locale,
        // home: const HomeScreen(),
        // builder: (context, child) => MediaQuery.withClampedTextScaling(
        //   maxScaleFactor: 1,
        //   minScaleFactor: 1,
        //   child: LoaderOverlay(child: child!),
        // ),
        builder: (context, child) => MediaQuery(
          // key: _globalKey,
          data: mediaQueryData.copyWith(
            textScaler: TextScaler.linear(
              mediaQueryData.textScaler.scale(settings.textScale ?? 1).clamp(0.5, 2),
            ),
          ),
          child: child!,
        ),
      ),
    );
  }
}
