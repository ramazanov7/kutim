import 'dart:convert';
import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/core/rest_client/models/basic_response.dart';
import 'package:kutim/src/feature/auth/database/auth_dao.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';
import 'package:kutim/src/feature/main/data/main_remote_ds.dart';
import 'package:kutim/src/feature/main/model/product_dto.dart';
import 'package:kutim/src/feature/main/model/scan_dto.dart';

abstract interface class IMainRepository {
  Future<List<ProductDTO>> productList({required String search});

  Future<UserDTO> skinType({required String skinType});

  Future<ScanDTO> scan({required String skinType, required String url});

  Future<ScanDTO> imagePython({XFile? image});

  Future<BasicResponse> createProduct({
    required String name,
    required String description,
    XFile? image,
  });
}

class MainRepositoryImpl implements IMainRepository {
  const MainRepositoryImpl({
    required IMainRemoteDS remoteDS,
    required IAuthDao authDao,
  })  : _remoteDS = remoteDS,
        _authDao = authDao;
  final IMainRemoteDS _remoteDS;
  final IAuthDao _authDao;

  @override
  Future<List<ProductDTO>> productList({required String search}) async {
    try {
      return await _remoteDS.productList(search: search);
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

  @override
  Future<BasicResponse> createProduct({required String name, required String description, XFile? image}) async {
    try {
      return await _remoteDS.createProduct(name: name, description: description, image: image);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ScanDTO> scan({required String skinType, required String url}) async {
    try {
      final result = await _remoteDS.scan(skinType: skinType, url: url);

      log('-----------------------------------', name: 'scandDTO');
      await _authDao.scanDTO.setValue(jsonEncode(result.toJson()));
      log('$result', name: 'auth-repo');
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ScanDTO> imagePython({XFile? image}) async {
    try {
      return await _remoteDS.imagePython(image: image);
    } catch (e) {
      rethrow;
    }
  }
}
