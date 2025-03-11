import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kutim/src/feature/auth/data/auth_repository.dart';

part 'enter_sms_code_cubit.freezed.dart';

class EnterSmsCodeCubit extends Cubit<EnterSmsCodeState> {
  EnterSmsCodeCubit({
    required IAuthRepository repository,
  })  : _repository = repository,
        super(const EnterSmsCodeState.initial());
  final IAuthRepository _repository;

  Future<void> sendSmsCode({
    required String code,
    required String token,
  }) async {
    try {
      emit(const EnterSmsCodeState.loading());

      final result = await _repository.sendSms(
        code: code,
        token: token,
      );

      if (isClosed) return;

      emit(EnterSmsCodeState.loaded(token: result));
    } catch (e) {
      emit(
        EnterSmsCodeState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class EnterSmsCodeState with _$EnterSmsCodeState {
  const factory EnterSmsCodeState.initial() = _InitialState;

  const factory EnterSmsCodeState.loading() = _LoadingState;

  const factory EnterSmsCodeState.loaded({
    required String token,
  }) = _LoadedState;

  const factory EnterSmsCodeState.error({
    required String message,
  }) = _ErrorState;
}
