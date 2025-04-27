import 'package:kutim/src/feature/main/data/main_remote_ds.dart';
import 'package:kutim/src/feature/main/model/product_dto.dart';

abstract interface class IMainRepository {
  Future<List<ProductDTO>> productList({required String search});
}

class MainRepositoryImpl implements IMainRepository {
  const MainRepositoryImpl({
    required IMainRemoteDS remoteDS,
  }) : _remoteDS = remoteDS;
  final IMainRemoteDS _remoteDS;

  @override
  Future<List<ProductDTO>> productList({required String search}) async {
    try {
      return await _remoteDS.productList(search: search);
    } catch (e) {
      rethrow;
    }
  }
}
