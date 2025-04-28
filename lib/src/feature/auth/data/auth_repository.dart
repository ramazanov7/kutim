import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:kutim/src/feature/auth/data/auth_remote_ds.dart';
import 'package:kutim/src/feature/auth/database/auth_dao.dart';
import 'package:kutim/src/feature/auth/models/user_dto.dart';

abstract interface class IAuthRepository {
  bool get isAuthenticated;

  UserDTO? get user;

  int? get cityId;

  Future setCityId({
    required int cityId,
  });

  String? get skinType;

  Future setSkinType({
    required String skinType,
  });

  Future<void> clearUser();

  UserDTO? cacheUser();

  Future<UserDTO> login({
    required String email,
    required String password,
    String? deviceType,
  });

  Future<UserDTO> register({
    required String name,
    required String email,
    required String password,
    required String surname,
    String? deviceType,
  });

  Future<int> forgotPassword({
    required String email,
  });

  Future<String> sendSms({
    required String code,
    required String email,
  });

  Future<UserDTO> newPassword({
    required String password,
    required String email,
  });

  // TODO-------------------------

  Future<List<Map<String, dynamic>>> getForceUpdateVersion();

  Future sendDeviceToken();
}

class AuthRepositoryImpl implements IAuthRepository {
  const AuthRepositoryImpl({
    required IAuthRemoteDS remoteDS,
    required IAuthDao authDao,
  })  : _remoteDS = remoteDS,
        _authDao = authDao;
  final IAuthRemoteDS _remoteDS;
  final IAuthDao _authDao;

  @override
  bool get isAuthenticated => _authDao.user.value != null;

  @override
  int? get cityId {
    try {
      final cityId = _authDao.cityId.value;
      log('${_authDao.cityId.value}', name: 'Auth repository - cityId');
      if (cityId != null) {
        return cityId;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  String? get skinType {
    try {
      final s = _authDao.skinType.value;
      log('${_authDao.skinType.value}', name: 'Auth repository - skinType');
      if (s != null) {
        return s;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setCityId({
    required int cityId,
  }) async {
    try {
      await _authDao.cityId.setValue(cityId);
      log(name: 'City id', _authDao.cityId.value.toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setSkinType({required String skinType}) async {
    try {
      await _authDao.skinType.setValue(skinType);
      log(name: 'skin type', _authDao.skinType.value.toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  UserDTO? cacheUser() {
    try {
      if (_authDao.user.value != null) {
        final UserDTO user = UserDTO.fromJson(
          jsonDecode(_authDao.user.value!) as Map<String, dynamic>,
        );
        return user;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'getUserFromCache()');
    }
    return null;
  }

  @override
  Future<void> clearUser() async {
    try {
      await _authDao.user.remove();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getForceUpdateVersion() async {
    return [
      {
        'key': 'force_update_version',
        'value': '1.0.0',
      },
      {
        'key': 'store_review_version',
        'value': '1.0.0',
      },
    ];
  }

  @override
  Future sendDeviceToken() async {
    final String? dv = _authDao.deviceToken.value;
    try {
      final deviceToken = dv ?? '';

      await _remoteDS.sendDeviceToken(deviceToken: deviceToken, deviceType: Platform.isAndroid ? 'Android' : 'IOS');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserDTO> login({
    required String email,
    required String password,
    String? deviceType,
  }) async {
    final String? deviceToken = _authDao.deviceToken.value;
    log('${_authDao.deviceToken.value}', name: 'auth repo device token');
    try {
      final user = await _remoteDS.login(
        email: email,
        password: password,
        deviceToken: deviceToken,
        deviceType: deviceType,
      );

      await _authDao.user.setValue(jsonEncode(user.toJson()));
      log('$user', name: 'auth-repo');
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  UserDTO? get user {
    try {
      final userStr = _authDao.user.value;
      if (userStr != null) {
        // log(userStr, name: 'user in auth repo');
        return UserDTO.fromJson(
          jsonDecode(userStr) as Map<String, dynamic>,
        );
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<UserDTO> register({
    required String name,
    required String email,
    required String password,
    required String surname,
    String? deviceType,
  }) async {
    final String? dv = _authDao.deviceToken.value;
    try {
      final user = await _remoteDS.register(
        name: name,
        email: email,
        password: password,
        deviceToken: dv,
        deviceType: deviceType,
        surname: surname,
      );

      await _authDao.user.setValue(jsonEncode(user.toJson()));

      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> forgotPassword({required String email}) async {
    try {
      return await _remoteDS.forgotPassword(email: email);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> sendSms({required String code, required String email}) async {
    try {
      return await _remoteDS.sendSms(code: code, email: email);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserDTO> newPassword({required String password, required String email}) async {
    try {
      final user = await _remoteDS.newPassword(password: password, email: email);

      await _authDao.user.setValue(jsonEncode(user.toJson()));
      log('$user', name: 'auth-repo');
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
