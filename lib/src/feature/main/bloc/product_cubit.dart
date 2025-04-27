import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kutim/src/feature/main/data/main_repository.dart';
import 'package:kutim/src/feature/main/model/product_dto.dart';

part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({
    required IMainRepository repository,
  })  : _repository = repository,
        super(const ProductState.initial());
  final IMainRepository _repository;

  Future<void> getProductList({
    required String search,
    bool hasLoading = false,
    bool hasDelay = false,
  }) async {
    try {
      if (hasLoading) {
        emit(const ProductState.loading());
      }
      if (hasDelay) {
        await Future.delayed(const Duration(milliseconds: 500));
      }

      final result = await _repository.productList(search: search);

      if (isClosed) return;

      emit(ProductState.loaded(productDTO: result));
    } catch (e) {
      emit(
        ProductState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _InitialState;

  const factory ProductState.loading() = _LoadingState;

  const factory ProductState.loaded({
    required List<ProductDTO> productDTO,
  }) = _LoadedState;

  const factory ProductState.error({
    required String message,
  }) = _ErrorState;
}
