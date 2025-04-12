import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kutim/src/feature/auth/data/auth_repository.dart';

part 'password_recovery_cubit.freezed.dart';

class PasswordRecoveryCubit extends Cubit<PasswordRecoveryState> {
  PasswordRecoveryCubit({
    required IAuthRepository repository,
  })  : _repository = repository,
        super(const PasswordRecoveryState.initial());
  final IAuthRepository _repository;

  Future<void> forgotPassword({
    required String email,
  }) async {
    try {
      emit(const PasswordRecoveryState.loading());

      await _repository.forgotPassword(
        email: email,
      );

      if (isClosed) return;

      emit(const PasswordRecoveryState.loaded());
    } catch (e) {
      emit(
        PasswordRecoveryState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class PasswordRecoveryState with _$PasswordRecoveryState {
  const factory PasswordRecoveryState.initial() = _InitialState;

  const factory PasswordRecoveryState.loading() = _LoadingState;

  const factory PasswordRecoveryState.loaded() = _LoadedState;

  const factory PasswordRecoveryState.error({
    required String message,
  }) = _ErrorState;
}
