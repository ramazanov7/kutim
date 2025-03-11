import 'package:kutim/src/core/rest_client/rest_client.dart';

abstract interface class IMainRemoteDS {}

class MainRemoteDSImpl implements IMainRemoteDS {
  const MainRemoteDSImpl({
    required this.restClient,
  });
  final IRestClient restClient;
}
