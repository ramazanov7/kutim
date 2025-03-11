import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kutim/src/core/rest_client/rest_client.dart';
import 'package:kutim/src/feature/auth/data/auth_repository.dart';
import 'package:kutim/src/feature/auth/models/response/auth_error_response.dart';
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
    } on RestClientException catch (e) {
      _onRestClientException(e, email);
    } catch (e) {
      emit(
        LoginState.error(
          message: e.toString(),
          sendedOldValue: email,
        ),
      );
    }
  }

  void _onRestClientException(RestClientException e, String phone) {
    try {
      String? phoneFieldError;
      String? passwordFieldError;

      final cause = switch (e.cause) {
        final Map<String, Object?> map => map,
        _ => null,
      };

      if (cause case {'phone': final String? phone}) {
        phoneFieldError = phone;
      }
      if (cause case {'password': final String? password}) {
        passwordFieldError = password;
      }

      emit(
        LoginState.error(
          message: e.message,
          sendedOldValue: phone,
          authErrorResponse: AuthErrorResponse(
            phone: phoneFieldError,
            password: passwordFieldError,
          ),
        ),
      );
    } catch (e) {
      emit(
        LoginState.error(
          message: e.toString(),
          sendedOldValue: phone,
        ),
      );
      rethrow;
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

  const factory LoginState.error({
    required String message,
    required String sendedOldValue,
    AuthErrorResponse? authErrorResponse,
  }) = _ErrorState;
}
