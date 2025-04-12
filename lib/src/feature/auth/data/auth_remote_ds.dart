import 'package:kutim/src/core/rest_client/rest_client.dart';
import 'package:kutim/src/core/utils/talker_logger_util.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';

abstract interface class IAuthRemoteDS {
  Future<UserDTO> login({
    required String email,
    required String password,
    String? deviceToken,
    String? deviceType,
  });

  Future<UserDTO> register({
    required String name,
    required String email,
    required String password,
    required String surname,
    String? deviceToken,
    String? deviceType,
  });

  Future<int> forgotPassword({
    required String email,
  });

  Future<String> sendSms({
    required String code,
    required String email,
  });

  Future newPassword({
    required String password,
    required String email,
  });

  Future sendDeviceToken({
    required String deviceToken,
    required String deviceType,
  });
}

class AuthRemoteDSImpl implements IAuthRemoteDS {
  const AuthRemoteDSImpl({
    required this.restClient,
  });
  final IRestClient restClient;

  @override
  Future<UserDTO> login({
    required String email,
    required String password,
    String? deviceToken,
    String? deviceType,
  }) async {
    try {
      final Map<String, dynamic> response = await restClient.post(
        '/auth/login',
        body: {
          'email': email,
          'password': password,
          if (deviceToken != null) 'device_token': deviceToken,
          if (deviceType != null) 'device_type': deviceType,
        },
      );

      // final UserDTO user = UserDTO.fromJson(response['data'] as Map<String, dynamic>);
      return UserDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#login - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<UserDTO> register({
    required String? name,
    required String? email,
    required String? password,
    required String? surname,
    String? deviceToken,
    String? deviceType,
  }) async {
    try {
      final Map<String, dynamic> response = await restClient.post(
        '/auth/register',
        body: {
          'name': name,
          'email': email,
          'password': password,
          'full_name': surname,
          if (deviceToken != null) 'device_token': deviceToken,
          if (deviceType != null) 'device_type': deviceType,
        },
      );

      return UserDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#register - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<String> sendSms({required String code, required String email}) async {
    try {
      final Map<String, dynamic> response = await restClient.post(
        '/auth/check_code',
        body: {'code': code, 'email': email},
      );

      final String? payload = response['full_name'] as String?;
      if (payload != null && payload != '') {
        return payload;
      } else {
        throw WrongResponseTypeException(
          message: '''Unexpected response body type: ${response.runtimeType}\n$response''',
        );
      }
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#sendSmsCode - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<UserDTO> newPassword({
    required String password,
    required String email,
  }) async {
    try {
      final Map<String, dynamic> response = await restClient.post(
        '/auth/restore_password',
        body: {
          'password': password,
          'email': email,
        },
      );

      return UserDTO.fromJson(response);
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#newPassword - $e', e, st);
      rethrow;
    }
  }

  @override
  Future sendDeviceToken({
    required String deviceToken,
    required String deviceType,
  }) async {
    try {
      await restClient.post(
        '/auth/update-token',
        body: {
          'device_token': deviceToken,
          'device_type': deviceType,
        },
      );
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#sendDeviceToken - $e', e, st);
      rethrow;
    }
  }

  @override
  Future<int> forgotPassword({required String email}) async {
    try {
      final Map<String, dynamic> response = await restClient.post(
        '/auth/forgot_password',
        body: {'email': email},
      );

      final int? payload = response['code'] as int?;
      if (payload != null && payload != 0) {
        return payload;
      } else {
        throw WrongResponseTypeException(
          message: '''Unexpected response body type: ${response.runtimeType}\n$response''',
        );
      }
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('#forgotPassword - $e', e, st);
      rethrow;
    }
  }
}
