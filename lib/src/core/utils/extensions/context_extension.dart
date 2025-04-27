import 'package:flutter/material.dart';
import 'package:kutim/src/core/constant/localization/localization.dart';
import 'package:kutim/src/core/containers/repository_storage.dart';
import 'package:kutim/src/core/presentation/scopes/repository_scope.dart';
import 'package:kutim/src/core/utils/screen_util.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kutim/src/feature/app/initialization/model/dependencies_container.dart';
import 'package:kutim/src/feature/app/initialization/widget/dependencies_scope.dart';

import 'package:kutim/src/feature/settings/widget/settings_scope.dart';

/// List of extensions for [BuildContext]
extension ContextExtension on BuildContext {
  /// Obtain the nearest widget of the given type T,
  /// which must be the type of a concrete [InheritedWidget] subclass,
  /// and register this build context with that widget such that
  /// when that widget changes (or a new widget of that type is introduced,
  /// or the widget goes away), this build context is rebuilt so that it can
  /// obtain new values from that widget.
  T? inhMaybeOf<T extends InheritedWidget>({bool listen = true}) =>
      listen ? dependOnInheritedWidgetOfExactType<T>() : getInheritedWidgetOfExactType<T>();

  /// Obtain the nearest widget of the given type T,
  /// which must be the type of a concrete [InheritedWidget] subclass,
  /// and register this build context with that widget such that
  /// when that widget changes (or a new widget of that type is introduced,
  /// or the widget goes away), this build context is rebuilt so that it can
  /// obtain new values from that widget.
  T inhOf<T extends InheritedWidget>({bool listen = true}) =>
      inhMaybeOf<T>(listen: listen) ??
      (throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a $T of the exact type',
        'out_of_scope',
      ));

  /// Maybe inherit specific aspect from [InheritedModel].
  T? maybeInheritFrom<A extends Object, T extends InheritedModel<A>>({
    A? aspect,
  }) =>
      InheritedModel.inheritFrom<T>(this, aspect: aspect);

  /// Inherit specific aspect from [InheritedModel].
  T inheritFrom<A extends Object, T extends InheritedModel<A>>({A? aspect}) =>
      maybeInheritFrom(aspect: aspect) ??
      (throw ArgumentError(
        'Out of scope, not found inherited model '
            'a $T of the exact type',
        'out_of_scope',
      ));

  ///
  // IEnvironmentStorage get environment => EnvironmentScope.of(this);
  DependenciesContainer get dependencies => DependenciesScope.of(this);
  // AppDatabase get database => dependencies.database;

  IRepositoryStorage get repository => RepositoryScope.of(this);

  /// Перевести через контекст
  // AppLocalizations get localized => Localization.of(this);

  /// Выбранный язык

  Locale get currentLocale => SettingsScope.settingsOf(this).locale ?? const Locale('ru', 'RU');
// AppLanguage get currentLocale => SettingsScope.appLanguageOf(this);
  /// Выбранный город
  // CityDTO? get currentCity => SettingsScope.cityOf(this);

  /// Поддерживаемые языки
  // List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => MediaQuery.sizeOf(this);
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  TargetPlatform get platform => theme.platform;

  ScreenSize get deviceSize => ScreenUtil.screenSizeOf(this);
  // ScreenSize get deviceSizeOf => ScreenUtil.screenSizeOf(this);
  Orientation get orientation => ScreenUtil.orientation();
  // Scale height with design size
  double get scaleHeight => mediaQuery.size.height / 844;
  // Scale width with design size
  double get scaleWidth => mediaQuery.size.width / 390;
}

extension OrientationX on Orientation {
  T whenByValue<T extends Object?>({
    required T portrait,
    required T landscape,
  }) {
    switch (this) {
      case Orientation.portrait:
        return portrait;
      case Orientation.landscape:
        return landscape;

      // default:
      //   return portrait;
    }
  }

  T maybeWhenByValue<T extends Object?>({
    required T orElse,
    T? portrait,
    T? landscape,
  }) =>
      whenByValue<T>(
        portrait: portrait ?? orElse,
        landscape: landscape ?? orElse,
      );
}
