import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';
import 'package:kutim/src/feature/main/data/main_repository.dart';

part 'skin_type_cubit.freezed.dart';

class SkinTypeCubit extends Cubit<SkinTypeState> {
  SkinTypeCubit({
    required IMainRepository repository,
  })  : _repository = repository,
        super(const SkinTypeState.initial());

  final IMainRepository _repository;

  Future<void> updateSkinType({required String skinType}) async {
    try {
      emit(const SkinTypeState.loading());

      final result = await _repository.skinType(skinType: skinType);

      if (isClosed) return;

      emit(SkinTypeState.loaded(userDTO: result));
    } catch (e) {
      emit(
        SkinTypeState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class SkinTypeState with _$SkinTypeState {
  const factory SkinTypeState.initial() = _InitialState;

  const factory SkinTypeState.loading() = _LoadingState;

  const factory SkinTypeState.loaded({
    required UserDTO userDTO,
  }) = _LoadedState;

  const factory SkinTypeState.error({
    required String message,
  }) = _ErrorState;
}
