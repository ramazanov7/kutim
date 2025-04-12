import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kutim/src/feature/auth/data/auth_repository.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required IAuthRepository repository,
  })  : _repository = repository,
        super(const LoginState.initial());
  final IAuthRepository _repository;

  Future<void> login({
    required String email,
    required String password,
    String? deviceType,
  }) async {
    try {
      emit(const LoginState.loading());

      final user = await _repository.login(
        email: email,
        password: password,
        deviceType: deviceType,
      );

      if (isClosed) return;

      emit(LoginState.loaded(user: user));
    } catch (e) {
      emit(
        LoginState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _InitialState;

  const factory LoginState.loading() = _LoadingState;

  const factory LoginState.loaded({
    required UserDTO user,
  }) = _LoadedState;

  const factory LoginState.error({required String message}) = _ErrorState;
}
