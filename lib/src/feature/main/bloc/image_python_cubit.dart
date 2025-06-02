import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/feature/main/data/main_repository.dart';
import 'package:kutim/src/feature/main/model/scan_dto.dart';

part 'image_python_cubit.freezed.dart';

class ImagePythonCubit extends Cubit<ImagePythonState> {
  ImagePythonCubit({
    required IMainRepository repository,
  })  : _repository = repository,
        super(const ImagePythonState.initial());
  final IMainRepository _repository;

  Future<void> imagePython({XFile? image}) async {
    try {
      emit(const ImagePythonState.loading());

      final result = await _repository.imagePython(image: image);

      if (isClosed) return;

      emit(ImagePythonState.loaded(result: result));
    } catch (e) {
      emit(
        ImagePythonState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class ImagePythonState with _$ImagePythonState {
  const factory ImagePythonState.initial() = _InitialState;

  const factory ImagePythonState.loading() = _LoadingState;

  const factory ImagePythonState.loaded({
    required ScanDTO result,
  }) = _LoadedState;

  const factory ImagePythonState.error({
    required String message,
  }) = _ErrorState;
}
