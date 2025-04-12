import 'package:kutim/src/core/utils/talker_logger_util.dart';
import 'package:kutim/src/feature/app/logic/not_auth_logic.dart';
import 'package:kutim/src/feature/auth/data/auth_repository.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bloc.freezed.dart';

const _tag = 'AppBloc';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._authRepository) : super(const AppState.loading()) {
    NotAuthLogic().statusSubject.listen((value) async {
      debugPrint('_startListenDio message from stream: $value');
      // if (value == 402) {
      //   await _authRepository.clearUser().whenComplete(() {
      //     NotAuthLogic().statusSubject.add(-1);
      //     add(const AppEvent.changeState(state: AppState.banned()));
      //     TalkerLoggerUtil.talker.log('Ваш аккаунт был заблокирован, свяжитесь в администратором');
      //   });
      // }

      if (value == 401) {
        await _authRepository.clearUser().whenComplete(() {
          NotAuthLogic().statusSubject.add(-1);
          add(const AppEvent.changeState(state: AppState.notAuthorized()));
          TalkerLoggerUtil.talker.log('$_tag notauthworker is worked');
        });
      }
    });

    on<AppEvent>(
      (event, emit) async => event.map(
        exiting: (_) async => _exit(emit),
        checkAuth: (event) async => _checkAuth(event, emit),
        logining: (event) async => _login(event, emit),
        refreshLocal: (_) async => _refreshLocal(emit),
        sendDeviceToken: (_) async => _sendDeviceToken(),
        onboardingSave: (_OnboardingSave event) async => _onboardingSave(event, emit),
        changeState: (event) async => _changeState(event, emit),
      ),
    );
  }
  final IAuthRepository _authRepository;

  bool get isAuthenticated => _authRepository.isAuthenticated;

  int _getExtendedVersionNumber(String version) {
    final versionCellsStr = version.split('.');
    final versionCells = versionCellsStr.map(int.parse).toList();
    return versionCells.first * 100000 + versionCells[1] * 1000 + versionCells[2];
  }

  String? _versionParser(Object? data) {
    try {
      if (data is List) {
        final list = data;
        if (list.isNotEmpty) {
          final map = list.firstWhereOrNull(
            (element) => ((element as Map<String, dynamic>)['key'] as String?) == 'force_update_version',
          ) as Map<String, dynamic>?;
          return map?['value'] as String?;
        }
      } else if (data is Map<String, dynamic>) {
        final map = data;
        return map['value'] as String?;
      }
      return null;
    } catch (error, st) {
      // TODO:
      TalkerLoggerUtil.talker.handle(error, st);
      TalkerLoggerUtil.talker.error('$_tag $error', st);
      onError(error, st);
    }
    return null;
  }

  Future<void> _checkAuth(
    _CheckAuthEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(const AppState.loading());
    try {
      final forceUpdateResult = await _authRepository.getForceUpdateVersion();
      final versionProj = _getExtendedVersionNumber(event.version);
      final versionFromBack = _versionParser(forceUpdateResult);
      final versionFromServer = _getExtendedVersionNumber(versionFromBack ?? event.version);

      if (versionProj >= versionFromServer) {
        if (_authRepository.isAuthenticated) {
          emit(const AppState.inApp());
        } else {
          emit(const AppState.notAuthorized());
        }
      } else {
        if (kDebugMode) {
          if (_authRepository.isAuthenticated) {
            emit(const AppState.inApp());
          } else {
            emit(const AppState.notAuthorized());
          }
        } else {
          emit(const AppState.notAvailableVersion());
        }
      }
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('$_tag $e', st);
      emit(AppState.error(message: e.toString()));
    }
  }

  Future<void> _onboardingSave(
    _OnboardingSave event,
    Emitter<AppState> emit,
  ) async {
    // _authRepository.setOnboarding(onboarding: true);
    // emit(const AppState.formState());
  }

  Future<void> _login(
    _LoginingEvent event,
    Emitter<AppState> emit,
  ) async {
    debugPrint('$_tag AppBloc _login');
    emit(
      const AppState.inApp(),
    );
  }

  Future<void> _exit(Emitter<AppState> emit) async {
    emit(const AppState.loading());

    await _authRepository.clearUser();
    NotAuthLogic().statusSubject.add(-1);

    emit(const AppState.notAuthorized());
  }

  Future<void> _refreshLocal(Emitter<AppState> emit) async {
    await state.maybeWhen(
      inApp: () async {
        emit(const AppState.loading());
        await Future<void>.delayed(const Duration(milliseconds: 100));
        emit(const AppState.inApp());
      },
      orElse: () async {
        emit(const AppState.loading());
        await Future<void>.delayed(const Duration(milliseconds: 100));
        emit(const AppState.notAuthorized());
      },
    );
  }

  Future<void> _sendDeviceToken() async {
    try {
      await _authRepository.sendDeviceToken();
    } catch (error, st) {
      // TODO:
      TalkerLoggerUtil.talker.handle(error, st);
      TalkerLoggerUtil.talker.error('$_tag $error', st);
    }
  }

  Future<void> _changeState(
    _ChangeStateEvent event,
    Emitter<AppState> emit,
  ) async =>
      emit(event.state);
}

@freezed
sealed class AppEvent with _$AppEvent {
  const factory AppEvent.checkAuth({
    required String version,
  }) = _CheckAuthEvent;

  const factory AppEvent.logining({
    required UserDTO user,
  }) = _LoginingEvent;

  const factory AppEvent.exiting() = _ExitingEvent;

  const factory AppEvent.refreshLocal() = _RefreshLocalEvent;

  const factory AppEvent.sendDeviceToken() = _SendDeviceTokenEvent;

  const factory AppEvent.onboardingSave() = _OnboardingSave;

  const factory AppEvent.changeState({
    required AppState state,
  }) = _ChangeStateEvent;
}

@freezed
sealed class AppState with _$AppState {
  const factory AppState.loading() = _LoadingAppState;

  const factory AppState.notAuthorized() = _NotAuthorizedState;

  const factory AppState.onboardingState() = _OnboardingState;

  const factory AppState.inApp() = _InAppState;

  const factory AppState.notAvailableVersion() = _NotAvailableVersion;

  const factory AppState.error({
    required String message,
  }) = _ErrorAppState;
}
