import 'package:shared_preferences/shared_preferences.dart';

import 'package:kutim/src/core/database/shared_preferences/typed_preferences_dao.dart';

abstract class IAuthDao {
  PreferencesEntry<String> get user;

  PreferencesEntry<String> get deviceToken;

  PreferencesEntry<int> get cityId;

  PreferencesEntry<String> get skinType;

  PreferencesEntry<String> get scanDTO;

  PreferencesEntry<String> get productName;

  PreferencesEntry<String> get productImage;

  PreferencesEntry<String> get productDescription;

  PreferencesEntry<String> get productId;
}

class AuthDao extends TypedPreferencesDao implements IAuthDao {
  AuthDao({
    required SharedPreferencesWithCache sharedPreferences,
  }) : super(sharedPreferences, name: 'auth');

  @override
  PreferencesEntry<String> get user => stringEntry('user');

  @override
  PreferencesEntry<String> get deviceToken => stringEntry('deviceToken');

  @override
  PreferencesEntry<int> get cityId => intEntry('cityId');

  @override
  PreferencesEntry<String> get skinType => stringEntry('skinType');

  @override
  PreferencesEntry<String> get scanDTO => stringEntry('scanDTO');

  @override
  PreferencesEntry<String> get productName => stringEntry('productName');

  @override
  PreferencesEntry<String> get productImage => stringEntry('productImage');

  @override
  PreferencesEntry<String> get productId => stringEntry('productId');

  @override
  PreferencesEntry<String> get productDescription => stringEntry('productDescription');
}
