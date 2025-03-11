import 'package:kutim/src/feature/main/data/main_remote_ds.dart';

abstract interface class IMainRepository {}

class MainRepositoryImpl implements IMainRepository {
  const MainRepositoryImpl({
    required IMainRemoteDS remoteDS,
  }) : _remoteDS = remoteDS;
  final IMainRemoteDS _remoteDS;
}
