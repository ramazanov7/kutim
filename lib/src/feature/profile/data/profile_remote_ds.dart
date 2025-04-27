import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kutim/src/core/rest_client/models/basic_response.dart';
import 'package:kutim/src/core/rest_client/rest_client.dart';
import 'package:kutim/src/core/utils/talker_logger_util.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';

abstract interface class IProfileRemoteDS {
  Future<UserDTO> profileData();

  Future<BasicResponse> deleteAccount();

  Future<BasicResponse> logOut();

  Future<BasicResponse> editAccount({
    required String password,
    required String fullName,
    required String email,
    XFile? avatar,
  });
}

class ProfileRemoteDSImpl implements IProfileRemoteDS {
  const ProfileRemoteDSImpl({
    required this.restClient,
  });
  final IRestClient restClient;

  @override
  Future<UserDTO> profileData() async {
    try {
      final Map<String, dynamic> response = await restClient.get(
        '/profile',
        queryParams: {},
      );

      return UserDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#getProfile - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<BasicResponse> deleteAccount() async {
    try {
      final Map<String, dynamic> response = await restClient.delete(
        'auth/delete',
      );

      return BasicResponse.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#deleteAccount - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<BasicResponse> editAccount({
    required String password,
    required String fullName,
    required String email,
    XFile? avatar,
  }) async {
    try {
      final Map<String, dynamic> data = {};

      if (email.isNotEmpty) data['email'] = email;
      if (fullName.isNotEmpty) data['full_name'] = fullName;
      if (password.isNotEmpty) data['password'] = password;

      final FormData formData = FormData.fromMap(data);
      if (avatar != null) {
        formData.files.add(
          MapEntry('avatar', await MultipartFile.fromFile(avatar.path)),
        );
      }

      final Map<String, dynamic> response = await restClient.post(
        '/profile/edit',
        body: formData,
      );

      return BasicResponse.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#editAccount - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<BasicResponse> logOut() async {
    try {
      final Map<String, dynamic> response = await restClient.post('/auth/logout', body: null);

      return BasicResponse.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#logout - $e', e, st);
      rethrow;
    }
  }
}
