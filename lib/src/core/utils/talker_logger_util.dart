import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:talker/talker.dart';

class TalkerLoggerUtil {
  factory TalkerLoggerUtil() => _instance; // Фабричный метод

  TalkerLoggerUtil._internal(); // Приватный конструктор

  static final TalkerLoggerUtil _instance = TalkerLoggerUtil._internal();

  static final Talker talker = TalkerFlutter.init(
    settings: TalkerSettings(
      useConsoleLogs: !(const bool.fromEnvironment(
        'dart.vm.product',
        defaultValue: true,
      )),
      colors: {
        // TalkerLogType.verbose: AnsiPen()..yellow(),
      },
    ),
  );
}

extension TalkerFlutter on Talker {
  static Talker init({
    TalkerLogger? logger,
    TalkerObserver? observer,
    TalkerSettings? settings,
    TalkerFilter? filter,
  }) =>
      Talker(
        logger: (logger ?? TalkerLogger()).copyWith(
          output: _defaultFlutterOutput,
        ),
        settings: settings,
        observer: observer,
        filter: filter,
      );

  static dynamic _defaultFlutterOutput(String message) {
    if (kIsWeb) {
      // ignore: avoid_print
      print(message);
      return;
    }
    if ([TargetPlatform.iOS, TargetPlatform.macOS].contains(defaultTargetPlatform)) {
      log(message, name: 'autohelp');
      return;
    }
    debugPrint(message);
  }
}
