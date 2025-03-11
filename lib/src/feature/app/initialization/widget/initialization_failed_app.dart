import 'package:flutter/material.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/app/presentation/pages/force_update_page.dart';

/// {@template initialization_failed_screen}
/// Screen that is shown when the initialization of the app fails.
/// {@endtemplate}
class InitializationFailedApp extends StatefulWidget {
  /// The error that caused the initialization to fail.
  final Object error;

  /// The stack trace of the error that caused the initialization to fail.
  final StackTrace stackTrace;

  /// The callback that will be called when the retry button is pressed.
  ///
  /// If null, the retry button will not be shown.
  final Future<void> Function()? retryInitialization;

  /// {@macro initialization_failed_screen}
  const InitializationFailedApp({
    required this.error,
    required this.stackTrace,
    this.retryInitialization,
    super.key,
  });

  @override
  State<InitializationFailedApp> createState() => _InitializationFailedAppState();
}

class _InitializationFailedAppState extends State<InitializationFailedApp> {
  /// Whether the initialization is in progress.
  final _inProgress = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _inProgress.dispose();
    super.dispose();
  }

  Future<void> _retryInitialization() async {
    // _inProgress.value = true;
    await widget.retryInitialization?.call();
    _inProgress.value = false;
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        color: AppColors.mainColor,
        home: ValueListenableBuilder(
          valueListenable: _inProgress,
          builder: (context, v, c) {
            if (_inProgress.value) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else {
              return ForceUpdatePage.noAvailable(
                onTap: _retryInitialization,
                error: widget.error,
                stackTrace: widget.stackTrace,
              );
            }
          },
        ),
      );
}
