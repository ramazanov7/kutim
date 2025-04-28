import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/feature/main/data/main_repository.dart';
import 'package:kutim/src/feature/main/model/scan_dto.dart';

part 'scan_cubit.freezed.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit({
    required IMainRepository repository,
  })  : _repository = repository,
        super(const ScanState.initial());
  final IMainRepository _repository;

  Future<void> scan({
    XFile? image,
  }) async {
    try {
      emit(const ScanState.loading());

      final result = await _repository.scan(image: image);

      if (isClosed) return;

      emit(ScanState.loaded(scanDTO: result));
    } catch (e) {
      emit(
        ScanState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class ScanState with _$ScanState {
  const factory ScanState.initial() = _InitialState;

  const factory ScanState.loading() = _LoadingState;

  const factory ScanState.loaded({
    required ScanDTO scanDTO,
  }) = _LoadedState;

  const factory ScanState.error({
    required String message,
  }) = _ErrorState;
}
