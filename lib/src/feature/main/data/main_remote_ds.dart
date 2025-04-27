import 'package:flutter/foundation.dart';
import 'package:kutim/src/core/rest_client/rest_client.dart';
import 'package:kutim/src/core/utils/talker_logger_util.dart';
import 'package:kutim/src/feature/main/model/product_dto.dart';

abstract interface class IMainRemoteDS {
  Future<List<ProductDTO>> productList({required String search});
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
}
