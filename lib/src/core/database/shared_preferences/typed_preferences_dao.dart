import 'package:kutim/src/core/database/shared_preferences/shared_preferences_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences_entries.dart';

abstract class PreferencesEntry<T> {
  T? get value;
  bool get exists;

  Future<void> setValue(T value);
  Future<void> remove();
}

abstract class ITypedPreferencesActions {
  // Future<Set<String>> keys();

  Future<void> clear();
}

abstract class ITypedPreferencesEntries {
  PreferencesEntry<bool> boolEntry(String key);

  PreferencesEntry<int> intEntry(String key);

  PreferencesEntry<double> doubleEntry(String key);

  PreferencesEntry<String> stringEntry(String key);

  PreferencesEntry<List<String>> stringListEntry(String key);
}

abstract class ITypedPreferencesDao implements ITypedPreferencesActions, ITypedPreferencesEntries {}

class _TypedSharedPreferencesDaoDelegate extends SharedPreferencesDao {
  _TypedSharedPreferencesDaoDelegate(
    super.sharedPreferences,
    String name,
  ) : super(name: 'typed_$name');
}

abstract class TypedPreferencesDao implements ITypedPreferencesDao {
  late final Map<String, PreferencesEntry> _entries = {};
  final ISharedPreferencesDao _delegate;

  TypedPreferencesDao(
    SharedPreferencesWithCache sharedPreferences, {
    required String name,
  }) : _delegate = _TypedSharedPreferencesDaoDelegate(sharedPreferences, name);

  // @override
  // Future<Set<String>> keys() => _delegate.getKeys();

  @override
  Future<void> clear() => _delegate.clear();

  @override
  PreferencesEntry<bool> boolEntry(String key) =>
      _entries.putIfAbsent(key, () => _BoolEntry(key, _delegate)) as PreferencesEntry<bool>;

  @override
  PreferencesEntry<int> intEntry(String key) =>
      _entries.putIfAbsent(key, () => _IntEntry(key, _delegate)) as PreferencesEntry<int>;

  @override
  PreferencesEntry<double> doubleEntry(String key) =>
      _entries.putIfAbsent(key, () => _DoubleEntry(key, _delegate)) as PreferencesEntry<double>;

  @override
  PreferencesEntry<String> stringEntry(String key) =>
      _entries.putIfAbsent(key, () => _StringEntry(key, _delegate)) as PreferencesEntry<String>;

  @override
  PreferencesEntry<List<String>> stringListEntry(String key) =>
      _entries.putIfAbsent(key, () => _StringListEntry(key, _delegate)) as PreferencesEntry<List<String>>;
}
