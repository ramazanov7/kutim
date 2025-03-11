import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/core/rest_client/models/basic_response.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';
import 'package:kutim/src/feature/profile/data/profile_remote_ds.dart';

abstract interface class IProfileRepository {
  Future<UserDTO> profileData();

  Future<BasicResponse> deleteAccount();

  Future<BasicResponse> logout();
  Future<BasicResponse> editAccount({
    required String password,
    required String name,
    required String email,
    required String phone,
    required int cityId,
    required int languageId,
    XFile? avatar,
  });
}

class ProfileRepositoryImpl implements IProfileRepository {
  const ProfileRepositoryImpl({
    required IProfileRemoteDS remoteDS,
  }) : _remoteDS = remoteDS;
  final IProfileRemoteDS _remoteDS;

  @override
  Future<UserDTO> profileData() async {
    try {
      return await _remoteDS.profileData();
    } catch (e) {
      rethrow;
    }
  }

  //  @override
  // Future<BasicResponse> logOut() async => _client.execute(
  //     route:  AuthApi.logout(), responseType: BasicResponse());

  @override
  Future<BasicResponse> deleteAccount() async {
    try {
      return await _remoteDS.deleteAccount();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BasicResponse> editAccount({
    required String password,
    required String name,
    required String email,
    required String phone,
    required int cityId,
    required int languageId,
    XFile? avatar,
  }) async {
    try {
      log('$avatar', name: 'repository avatar');
      return await _remoteDS.editAccount(
          password: password,
          name: name,
          email: email,
          phone: phone,
          cityId: cityId,
          languageId: languageId,
          avatar: avatar);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BasicResponse> logout() async {
    try {
      return await _remoteDS.logOut();
    } catch (e) {
      rethrow;
    }
  }
}
