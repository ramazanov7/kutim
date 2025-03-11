import 'dart:async';
import 'package:kutim/src/core/utils/refined_logger.dart';
import 'package:kutim/src/feature/app/logic/app_runner.dart';

void main() => runZonedGuarded(
      () => const AppRunner().initializeAndRun(),
      logger.logZoneError,
    );
