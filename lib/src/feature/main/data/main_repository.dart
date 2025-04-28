import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';
import 'package:kutim/src/feature/main/data/main_remote_ds.dart';
import 'package:kutim/src/feature/main/model/product_dto.dart';
import 'package:kutim/src/feature/main/model/scan_dto.dart';

abstract interface class IMainRepository {
  Future<List<ProductDTO>> productList({required String search});

  Future<UserDTO> skinType({required String skinType});

  Future<ScanDTO> scan({XFile? image});
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

  @override
  Future<ScanDTO> scan({XFile? image}) async {
    try {
      return await _remoteDS.scan(image: image);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserDTO> skinType({required String skinType}) async {
    try {
      return await _remoteDS.skinType(skinType: skinType);
    } catch (e) {
      rethrow;
    }
  }
}
