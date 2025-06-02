import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/core/rest_client/models/basic_response.dart';
import 'package:kutim/src/core/rest_client/rest_client.dart';
import 'package:kutim/src/core/utils/talker_logger_util.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';
import 'package:kutim/src/feature/main/model/product_dto.dart';
import 'package:kutim/src/feature/main/model/scan_dto.dart';

abstract interface class IMainRemoteDS {
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

class MainRemoteDSImpl implements IMainRemoteDS {
  const MainRemoteDSImpl({
    required this.restClient,
  });
  final IRestClient restClient;

  @override
  Future<List<ProductDTO>> productList({required String search}) async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        '/get_creams',
        queryParams: {'search': search},
      );

      if (response['data'] == null) {
        throw Exception();
      }
      final list = await compute<List<dynamic>, List<ProductDTO>>(
        (list) => list
            .map(
              (e) => ProductDTO.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        response['data'] as List,
      );
      return list;
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#productList - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<UserDTO> skinType({required String skinType}) async {
    try {
      final Map<String, dynamic> response = await restClient.post(
        '/skin_type/attach',
        body: {'skin_type': skinType},
      );
      return UserDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#skinType - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<BasicResponse> createProduct({required String name, required String description, XFile? image}) async {
    try {
      final Map<String, dynamic> data = {};

      if (name.isNotEmpty) data['name'] = name;
      if (description.isNotEmpty) data['description'] = description;

      final FormData formData = FormData.fromMap(data);
      if (image != null) {
        formData.files.add(
          MapEntry('image', await MultipartFile.fromFile(image.path)),
        );
      }

      final Map<String, dynamic> response = await restClient.post(
        '/get_creams/create',
        body: formData,
      );

      return BasicResponse.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#createProduct - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<ScanDTO> scan({required String skinType, required String url}) async {
    try {
      final Map<String, dynamic> response = await restClient.post(
        '/main/scan',
        body: {'skin_type': skinType, 'url': url},
      );
      return ScanDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#scan - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<ScanDTO> imagePython({XFile? image}) async {
    try {
      final formData = FormData();

      if (image != null) {
        formData.files.add(
          MapEntry(
            'file',
            await MultipartFile.fromFile(image.path),
          ),
        );
      }

      final Map<String, dynamic> response = await restClient.post(
        '/main/image',
        body: formData,
      );

      return ScanDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#imagePython - $e', e, st);
      rethrow;
    }
  }
}
