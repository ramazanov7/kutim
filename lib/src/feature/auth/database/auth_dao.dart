import 'package:shared_preferences/shared_preferences.dart';

import 'package:kutim/src/core/database/shared_preferences/typed_preferences_dao.dart';

abstract class IAuthDao {
  PreferencesEntry<String> get user;

  PreferencesEntry<String> get deviceToken;

  PreferencesEntry<int> get cityId;
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
}
