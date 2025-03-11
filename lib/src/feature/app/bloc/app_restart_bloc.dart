import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kutim/src/core/utils/talker_logger_util.dart';

part 'app_restart_bloc.freezed.dart';

class AppRestartBloc extends Bloc<AppRestartEvent, AppRestartState> {
  AppRestartBloc() : super(AppRestartState.loaded(key: UniqueKey())) {
    on<AppRestartEvent>(
      (event, emit) async => event.map(
        restartApp: (_) async => _changeState(emit),
      ),
    );
  }

  Key _key = UniqueKey();

  Key get uniqueKey => _key;

  void restartApp() {
    _key = UniqueKey();
  }

  Future<void> _changeState(
    Emitter<AppRestartState> emit,
  ) async {
    try {
      emit(const AppRestartState.loading());
      restartApp();
      emit(AppRestartState.loaded(key: _key));
    } catch (e, st) {
      TalkerLoggerUtil.talker.error(
        '@AppRestartBloc $e',
        st,
      );
      emit(AppRestartState.error(message: e.toString()));
    }
  }
}

@freezed
sealed class AppRestartEvent with _$AppRestartEvent {
  const factory AppRestartEvent.restartApp() = _RestartAppEvent;
}

@freezed
sealed class AppRestartState with _$AppRestartState {
  const factory AppRestartState.loading() = _LoadingAppRestartState;

  const factory AppRestartState.loaded({
    required Key key,
  }) = _LoadedAppRestartState;

  const factory AppRestartState.error({
    required String message,
  }) = _ErrorAppRestartState;
}
