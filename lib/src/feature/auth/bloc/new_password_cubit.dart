import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kutim/src/core/rest_client/rest_client.dart';

import 'package:kutim/src/feature/auth/data/auth_repository.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';

part 'new_password_cubit.freezed.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit({
    required IAuthRepository repository,
  })  : _repository = repository,
        super(const NewPasswordState.initial());
  final IAuthRepository _repository;

  Future<void> newPassword({
    required String password,
    required String email,
  }) async {
    try {
      emit(const NewPasswordState.loading());

      final user = await _repository.newPassword(password: password, email: email);

      if (isClosed) return;

      emit(NewPasswordState.loaded(user: user));
    } on RestClientException catch (e) {
      emit(
        NewPasswordState.error(
          message: e.message,
        ),
      );
    } catch (e) {
      emit(
        NewPasswordState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class NewPasswordState with _$NewPasswordState {
  const factory NewPasswordState.initial() = _InitialState;

  const factory NewPasswordState.loading() = _LoadingState;

  const factory NewPasswordState.loaded({required UserDTO user}) = _LoadedState;

  const factory NewPasswordState.error({
    required String message,
  }) = _ErrorState;
}
