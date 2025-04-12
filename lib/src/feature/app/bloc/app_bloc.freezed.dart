// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String version) checkAuth,
    required TResult Function(UserDTO user) logining,
    required TResult Function() exiting,
    required TResult Function() refreshLocal,
    required TResult Function() sendDeviceToken,
    required TResult Function() onboardingSave,
    required TResult Function(AppState state) changeState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String version)? checkAuth,
    TResult? Function(UserDTO user)? logining,
    TResult? Function()? exiting,
    TResult? Function()? refreshLocal,
    TResult? Function()? sendDeviceToken,
    TResult? Function()? onboardingSave,
    TResult? Function(AppState state)? changeState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String version)? checkAuth,
    TResult Function(UserDTO user)? logining,
    TResult Function()? exiting,
    TResult Function()? refreshLocal,
    TResult Function()? sendDeviceToken,
    TResult Function()? onboardingSave,
    TResult Function(AppState state)? changeState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthEvent value) checkAuth,
    required TResult Function(_LoginingEvent value) logining,
    required TResult Function(_ExitingEvent value) exiting,
    required TResult Function(_RefreshLocalEvent value) refreshLocal,
    required TResult Function(_SendDeviceTokenEvent value) sendDeviceToken,
    required TResult Function(_OnboardingSave value) onboardingSave,
    required TResult Function(_ChangeStateEvent value) changeState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthEvent value)? checkAuth,
    TResult? Function(_LoginingEvent value)? logining,
    TResult? Function(_ExitingEvent value)? exiting,
    TResult? Function(_RefreshLocalEvent value)? refreshLocal,
    TResult? Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult? Function(_OnboardingSave value)? onboardingSave,
    TResult? Function(_ChangeStateEvent value)? changeState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthEvent value)? checkAuth,
    TResult Function(_LoginingEvent value)? logining,
    TResult Function(_ExitingEvent value)? exiting,
    TResult Function(_RefreshLocalEvent value)? refreshLocal,
    TResult Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult Function(_OnboardingSave value)? onboardingSave,
    TResult Function(_ChangeStateEvent value)? changeState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckAuthEventImplCopyWith<$Res> {
  factory _$$CheckAuthEventImplCopyWith(_$CheckAuthEventImpl value,
          $Res Function(_$CheckAuthEventImpl) then) =
      __$$CheckAuthEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String version});
}

/// @nodoc
class __$$CheckAuthEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$CheckAuthEventImpl>
    implements _$$CheckAuthEventImplCopyWith<$Res> {
  __$$CheckAuthEventImplCopyWithImpl(
      _$CheckAuthEventImpl _value, $Res Function(_$CheckAuthEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_$CheckAuthEventImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckAuthEventImpl
    with DiagnosticableTreeMixin
    implements _CheckAuthEvent {
  const _$CheckAuthEventImpl({required this.version});

  @override
  final String version;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.checkAuth(version: $version)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.checkAuth'))
      ..add(DiagnosticsProperty('version', version));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckAuthEventImpl &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, version);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckAuthEventImplCopyWith<_$CheckAuthEventImpl> get copyWith =>
      __$$CheckAuthEventImplCopyWithImpl<_$CheckAuthEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String version) checkAuth,
    required TResult Function(UserDTO user) logining,
    required TResult Function() exiting,
    required TResult Function() refreshLocal,
    required TResult Function() sendDeviceToken,
    required TResult Function() onboardingSave,
    required TResult Function(AppState state) changeState,
  }) {
    return checkAuth(version);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String version)? checkAuth,
    TResult? Function(UserDTO user)? logining,
    TResult? Function()? exiting,
    TResult? Function()? refreshLocal,
    TResult? Function()? sendDeviceToken,
    TResult? Function()? onboardingSave,
    TResult? Function(AppState state)? changeState,
  }) {
    return checkAuth?.call(version);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String version)? checkAuth,
    TResult Function(UserDTO user)? logining,
    TResult Function()? exiting,
    TResult Function()? refreshLocal,
    TResult Function()? sendDeviceToken,
    TResult Function()? onboardingSave,
    TResult Function(AppState state)? changeState,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth(version);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthEvent value) checkAuth,
    required TResult Function(_LoginingEvent value) logining,
    required TResult Function(_ExitingEvent value) exiting,
    required TResult Function(_RefreshLocalEvent value) refreshLocal,
    required TResult Function(_SendDeviceTokenEvent value) sendDeviceToken,
    required TResult Function(_OnboardingSave value) onboardingSave,
    required TResult Function(_ChangeStateEvent value) changeState,
  }) {
    return checkAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthEvent value)? checkAuth,
    TResult? Function(_LoginingEvent value)? logining,
    TResult? Function(_ExitingEvent value)? exiting,
    TResult? Function(_RefreshLocalEvent value)? refreshLocal,
    TResult? Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult? Function(_OnboardingSave value)? onboardingSave,
    TResult? Function(_ChangeStateEvent value)? changeState,
  }) {
    return checkAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthEvent value)? checkAuth,
    TResult Function(_LoginingEvent value)? logining,
    TResult Function(_ExitingEvent value)? exiting,
    TResult Function(_RefreshLocalEvent value)? refreshLocal,
    TResult Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult Function(_OnboardingSave value)? onboardingSave,
    TResult Function(_ChangeStateEvent value)? changeState,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth(this);
    }
    return orElse();
  }
}

abstract class _CheckAuthEvent implements AppEvent {
  const factory _CheckAuthEvent({required final String version}) =
      _$CheckAuthEventImpl;

  String get version;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckAuthEventImplCopyWith<_$CheckAuthEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginingEventImplCopyWith<$Res> {
  factory _$$LoginingEventImplCopyWith(
          _$LoginingEventImpl value, $Res Function(_$LoginingEventImpl) then) =
      __$$LoginingEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserDTO user});

  $UserDTOCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginingEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$LoginingEventImpl>
    implements _$$LoginingEventImplCopyWith<$Res> {
  __$$LoginingEventImplCopyWithImpl(
      _$LoginingEventImpl _value, $Res Function(_$LoginingEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoginingEventImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO,
    ));
  }

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDTOCopyWith<$Res> get user {
    return $UserDTOCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$LoginingEventImpl
    with DiagnosticableTreeMixin
    implements _LoginingEvent {
  const _$LoginingEventImpl({required this.user});

  @override
  final UserDTO user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.logining(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.logining'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginingEventImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginingEventImplCopyWith<_$LoginingEventImpl> get copyWith =>
      __$$LoginingEventImplCopyWithImpl<_$LoginingEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String version) checkAuth,
    required TResult Function(UserDTO user) logining,
    required TResult Function() exiting,
    required TResult Function() refreshLocal,
    required TResult Function() sendDeviceToken,
    required TResult Function() onboardingSave,
    required TResult Function(AppState state) changeState,
  }) {
    return logining(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String version)? checkAuth,
    TResult? Function(UserDTO user)? logining,
    TResult? Function()? exiting,
    TResult? Function()? refreshLocal,
    TResult? Function()? sendDeviceToken,
    TResult? Function()? onboardingSave,
    TResult? Function(AppState state)? changeState,
  }) {
    return logining?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String version)? checkAuth,
    TResult Function(UserDTO user)? logining,
    TResult Function()? exiting,
    TResult Function()? refreshLocal,
    TResult Function()? sendDeviceToken,
    TResult Function()? onboardingSave,
    TResult Function(AppState state)? changeState,
    required TResult orElse(),
  }) {
    if (logining != null) {
      return logining(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthEvent value) checkAuth,
    required TResult Function(_LoginingEvent value) logining,
    required TResult Function(_ExitingEvent value) exiting,
    required TResult Function(_RefreshLocalEvent value) refreshLocal,
    required TResult Function(_SendDeviceTokenEvent value) sendDeviceToken,
    required TResult Function(_OnboardingSave value) onboardingSave,
    required TResult Function(_ChangeStateEvent value) changeState,
  }) {
    return logining(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthEvent value)? checkAuth,
    TResult? Function(_LoginingEvent value)? logining,
    TResult? Function(_ExitingEvent value)? exiting,
    TResult? Function(_RefreshLocalEvent value)? refreshLocal,
    TResult? Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult? Function(_OnboardingSave value)? onboardingSave,
    TResult? Function(_ChangeStateEvent value)? changeState,
  }) {
    return logining?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthEvent value)? checkAuth,
    TResult Function(_LoginingEvent value)? logining,
    TResult Function(_ExitingEvent value)? exiting,
    TResult Function(_RefreshLocalEvent value)? refreshLocal,
    TResult Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult Function(_OnboardingSave value)? onboardingSave,
    TResult Function(_ChangeStateEvent value)? changeState,
    required TResult orElse(),
  }) {
    if (logining != null) {
      return logining(this);
    }
    return orElse();
  }
}

abstract class _LoginingEvent implements AppEvent {
  const factory _LoginingEvent({required final UserDTO user}) =
      _$LoginingEventImpl;

  UserDTO get user;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginingEventImplCopyWith<_$LoginingEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExitingEventImplCopyWith<$Res> {
  factory _$$ExitingEventImplCopyWith(
          _$ExitingEventImpl value, $Res Function(_$ExitingEventImpl) then) =
      __$$ExitingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExitingEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$ExitingEventImpl>
    implements _$$ExitingEventImplCopyWith<$Res> {
  __$$ExitingEventImplCopyWithImpl(
      _$ExitingEventImpl _value, $Res Function(_$ExitingEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ExitingEventImpl with DiagnosticableTreeMixin implements _ExitingEvent {
  const _$ExitingEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.exiting()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppEvent.exiting'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExitingEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String version) checkAuth,
    required TResult Function(UserDTO user) logining,
    required TResult Function() exiting,
    required TResult Function() refreshLocal,
    required TResult Function() sendDeviceToken,
    required TResult Function() onboardingSave,
    required TResult Function(AppState state) changeState,
  }) {
    return exiting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String version)? checkAuth,
    TResult? Function(UserDTO user)? logining,
    TResult? Function()? exiting,
    TResult? Function()? refreshLocal,
    TResult? Function()? sendDeviceToken,
    TResult? Function()? onboardingSave,
    TResult? Function(AppState state)? changeState,
  }) {
    return exiting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String version)? checkAuth,
    TResult Function(UserDTO user)? logining,
    TResult Function()? exiting,
    TResult Function()? refreshLocal,
    TResult Function()? sendDeviceToken,
    TResult Function()? onboardingSave,
    TResult Function(AppState state)? changeState,
    required TResult orElse(),
  }) {
    if (exiting != null) {
      return exiting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthEvent value) checkAuth,
    required TResult Function(_LoginingEvent value) logining,
    required TResult Function(_ExitingEvent value) exiting,
    required TResult Function(_RefreshLocalEvent value) refreshLocal,
    required TResult Function(_SendDeviceTokenEvent value) sendDeviceToken,
    required TResult Function(_OnboardingSave value) onboardingSave,
    required TResult Function(_ChangeStateEvent value) changeState,
  }) {
    return exiting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthEvent value)? checkAuth,
    TResult? Function(_LoginingEvent value)? logining,
    TResult? Function(_ExitingEvent value)? exiting,
    TResult? Function(_RefreshLocalEvent value)? refreshLocal,
    TResult? Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult? Function(_OnboardingSave value)? onboardingSave,
    TResult? Function(_ChangeStateEvent value)? changeState,
  }) {
    return exiting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthEvent value)? checkAuth,
    TResult Function(_LoginingEvent value)? logining,
    TResult Function(_ExitingEvent value)? exiting,
    TResult Function(_RefreshLocalEvent value)? refreshLocal,
    TResult Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult Function(_OnboardingSave value)? onboardingSave,
    TResult Function(_ChangeStateEvent value)? changeState,
    required TResult orElse(),
  }) {
    if (exiting != null) {
      return exiting(this);
    }
    return orElse();
  }
}

abstract class _ExitingEvent implements AppEvent {
  const factory _ExitingEvent() = _$ExitingEventImpl;
}

/// @nodoc
abstract class _$$RefreshLocalEventImplCopyWith<$Res> {
  factory _$$RefreshLocalEventImplCopyWith(_$RefreshLocalEventImpl value,
          $Res Function(_$RefreshLocalEventImpl) then) =
      __$$RefreshLocalEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshLocalEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$RefreshLocalEventImpl>
    implements _$$RefreshLocalEventImplCopyWith<$Res> {
  __$$RefreshLocalEventImplCopyWithImpl(_$RefreshLocalEventImpl _value,
      $Res Function(_$RefreshLocalEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshLocalEventImpl
    with DiagnosticableTreeMixin
    implements _RefreshLocalEvent {
  const _$RefreshLocalEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.refreshLocal()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppEvent.refreshLocal'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshLocalEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String version) checkAuth,
    required TResult Function(UserDTO user) logining,
    required TResult Function() exiting,
    required TResult Function() refreshLocal,
    required TResult Function() sendDeviceToken,
    required TResult Function() onboardingSave,
    required TResult Function(AppState state) changeState,
  }) {
    return refreshLocal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String version)? checkAuth,
    TResult? Function(UserDTO user)? logining,
    TResult? Function()? exiting,
    TResult? Function()? refreshLocal,
    TResult? Function()? sendDeviceToken,
    TResult? Function()? onboardingSave,
    TResult? Function(AppState state)? changeState,
  }) {
    return refreshLocal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String version)? checkAuth,
    TResult Function(UserDTO user)? logining,
    TResult Function()? exiting,
    TResult Function()? refreshLocal,
    TResult Function()? sendDeviceToken,
    TResult Function()? onboardingSave,
    TResult Function(AppState state)? changeState,
    required TResult orElse(),
  }) {
    if (refreshLocal != null) {
      return refreshLocal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthEvent value) checkAuth,
    required TResult Function(_LoginingEvent value) logining,
    required TResult Function(_ExitingEvent value) exiting,
    required TResult Function(_RefreshLocalEvent value) refreshLocal,
    required TResult Function(_SendDeviceTokenEvent value) sendDeviceToken,
    required TResult Function(_OnboardingSave value) onboardingSave,
    required TResult Function(_ChangeStateEvent value) changeState,
  }) {
    return refreshLocal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthEvent value)? checkAuth,
    TResult? Function(_LoginingEvent value)? logining,
    TResult? Function(_ExitingEvent value)? exiting,
    TResult? Function(_RefreshLocalEvent value)? refreshLocal,
    TResult? Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult? Function(_OnboardingSave value)? onboardingSave,
    TResult? Function(_ChangeStateEvent value)? changeState,
  }) {
    return refreshLocal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthEvent value)? checkAuth,
    TResult Function(_LoginingEvent value)? logining,
    TResult Function(_ExitingEvent value)? exiting,
    TResult Function(_RefreshLocalEvent value)? refreshLocal,
    TResult Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult Function(_OnboardingSave value)? onboardingSave,
    TResult Function(_ChangeStateEvent value)? changeState,
    required TResult orElse(),
  }) {
    if (refreshLocal != null) {
      return refreshLocal(this);
    }
    return orElse();
  }
}

abstract class _RefreshLocalEvent implements AppEvent {
  const factory _RefreshLocalEvent() = _$RefreshLocalEventImpl;
}

/// @nodoc
abstract class _$$SendDeviceTokenEventImplCopyWith<$Res> {
  factory _$$SendDeviceTokenEventImplCopyWith(_$SendDeviceTokenEventImpl value,
          $Res Function(_$SendDeviceTokenEventImpl) then) =
      __$$SendDeviceTokenEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendDeviceTokenEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$SendDeviceTokenEventImpl>
    implements _$$SendDeviceTokenEventImplCopyWith<$Res> {
  __$$SendDeviceTokenEventImplCopyWithImpl(_$SendDeviceTokenEventImpl _value,
      $Res Function(_$SendDeviceTokenEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendDeviceTokenEventImpl
    with DiagnosticableTreeMixin
    implements _SendDeviceTokenEvent {
  const _$SendDeviceTokenEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.sendDeviceToken()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppEvent.sendDeviceToken'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendDeviceTokenEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String version) checkAuth,
    required TResult Function(UserDTO user) logining,
    required TResult Function() exiting,
    required TResult Function() refreshLocal,
    required TResult Function() sendDeviceToken,
    required TResult Function() onboardingSave,
    required TResult Function(AppState state) changeState,
  }) {
    return sendDeviceToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String version)? checkAuth,
    TResult? Function(UserDTO user)? logining,
    TResult? Function()? exiting,
    TResult? Function()? refreshLocal,
    TResult? Function()? sendDeviceToken,
    TResult? Function()? onboardingSave,
    TResult? Function(AppState state)? changeState,
  }) {
    return sendDeviceToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String version)? checkAuth,
    TResult Function(UserDTO user)? logining,
    TResult Function()? exiting,
    TResult Function()? refreshLocal,
    TResult Function()? sendDeviceToken,
    TResult Function()? onboardingSave,
    TResult Function(AppState state)? changeState,
    required TResult orElse(),
  }) {
    if (sendDeviceToken != null) {
      return sendDeviceToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthEvent value) checkAuth,
    required TResult Function(_LoginingEvent value) logining,
    required TResult Function(_ExitingEvent value) exiting,
    required TResult Function(_RefreshLocalEvent value) refreshLocal,
    required TResult Function(_SendDeviceTokenEvent value) sendDeviceToken,
    required TResult Function(_OnboardingSave value) onboardingSave,
    required TResult Function(_ChangeStateEvent value) changeState,
  }) {
    return sendDeviceToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthEvent value)? checkAuth,
    TResult? Function(_LoginingEvent value)? logining,
    TResult? Function(_ExitingEvent value)? exiting,
    TResult? Function(_RefreshLocalEvent value)? refreshLocal,
    TResult? Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult? Function(_OnboardingSave value)? onboardingSave,
    TResult? Function(_ChangeStateEvent value)? changeState,
  }) {
    return sendDeviceToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthEvent value)? checkAuth,
    TResult Function(_LoginingEvent value)? logining,
    TResult Function(_ExitingEvent value)? exiting,
    TResult Function(_RefreshLocalEvent value)? refreshLocal,
    TResult Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult Function(_OnboardingSave value)? onboardingSave,
    TResult Function(_ChangeStateEvent value)? changeState,
    required TResult orElse(),
  }) {
    if (sendDeviceToken != null) {
      return sendDeviceToken(this);
    }
    return orElse();
  }
}

abstract class _SendDeviceTokenEvent implements AppEvent {
  const factory _SendDeviceTokenEvent() = _$SendDeviceTokenEventImpl;
}

/// @nodoc
abstract class _$$OnboardingSaveImplCopyWith<$Res> {
  factory _$$OnboardingSaveImplCopyWith(_$OnboardingSaveImpl value,
          $Res Function(_$OnboardingSaveImpl) then) =
      __$$OnboardingSaveImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingSaveImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$OnboardingSaveImpl>
    implements _$$OnboardingSaveImplCopyWith<$Res> {
  __$$OnboardingSaveImplCopyWithImpl(
      _$OnboardingSaveImpl _value, $Res Function(_$OnboardingSaveImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnboardingSaveImpl
    with DiagnosticableTreeMixin
    implements _OnboardingSave {
  const _$OnboardingSaveImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.onboardingSave()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppEvent.onboardingSave'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnboardingSaveImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String version) checkAuth,
    required TResult Function(UserDTO user) logining,
    required TResult Function() exiting,
    required TResult Function() refreshLocal,
    required TResult Function() sendDeviceToken,
    required TResult Function() onboardingSave,
    required TResult Function(AppState state) changeState,
  }) {
    return onboardingSave();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String version)? checkAuth,
    TResult? Function(UserDTO user)? logining,
    TResult? Function()? exiting,
    TResult? Function()? refreshLocal,
    TResult? Function()? sendDeviceToken,
    TResult? Function()? onboardingSave,
    TResult? Function(AppState state)? changeState,
  }) {
    return onboardingSave?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String version)? checkAuth,
    TResult Function(UserDTO user)? logining,
    TResult Function()? exiting,
    TResult Function()? refreshLocal,
    TResult Function()? sendDeviceToken,
    TResult Function()? onboardingSave,
    TResult Function(AppState state)? changeState,
    required TResult orElse(),
  }) {
    if (onboardingSave != null) {
      return onboardingSave();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthEvent value) checkAuth,
    required TResult Function(_LoginingEvent value) logining,
    required TResult Function(_ExitingEvent value) exiting,
    required TResult Function(_RefreshLocalEvent value) refreshLocal,
    required TResult Function(_SendDeviceTokenEvent value) sendDeviceToken,
    required TResult Function(_OnboardingSave value) onboardingSave,
    required TResult Function(_ChangeStateEvent value) changeState,
  }) {
    return onboardingSave(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthEvent value)? checkAuth,
    TResult? Function(_LoginingEvent value)? logining,
    TResult? Function(_ExitingEvent value)? exiting,
    TResult? Function(_RefreshLocalEvent value)? refreshLocal,
    TResult? Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult? Function(_OnboardingSave value)? onboardingSave,
    TResult? Function(_ChangeStateEvent value)? changeState,
  }) {
    return onboardingSave?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthEvent value)? checkAuth,
    TResult Function(_LoginingEvent value)? logining,
    TResult Function(_ExitingEvent value)? exiting,
    TResult Function(_RefreshLocalEvent value)? refreshLocal,
    TResult Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult Function(_OnboardingSave value)? onboardingSave,
    TResult Function(_ChangeStateEvent value)? changeState,
    required TResult orElse(),
  }) {
    if (onboardingSave != null) {
      return onboardingSave(this);
    }
    return orElse();
  }
}

abstract class _OnboardingSave implements AppEvent {
  const factory _OnboardingSave() = _$OnboardingSaveImpl;
}

/// @nodoc
abstract class _$$ChangeStateEventImplCopyWith<$Res> {
  factory _$$ChangeStateEventImplCopyWith(_$ChangeStateEventImpl value,
          $Res Function(_$ChangeStateEventImpl) then) =
      __$$ChangeStateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppState state});

  $AppStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$ChangeStateEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$ChangeStateEventImpl>
    implements _$$ChangeStateEventImplCopyWith<$Res> {
  __$$ChangeStateEventImplCopyWithImpl(_$ChangeStateEventImpl _value,
      $Res Function(_$ChangeStateEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$ChangeStateEventImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as AppState,
    ));
  }

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppStateCopyWith<$Res> get state {
    return $AppStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$ChangeStateEventImpl
    with DiagnosticableTreeMixin
    implements _ChangeStateEvent {
  const _$ChangeStateEventImpl({required this.state});

  @override
  final AppState state;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.changeState(state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.changeState'))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeStateEventImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeStateEventImplCopyWith<_$ChangeStateEventImpl> get copyWith =>
      __$$ChangeStateEventImplCopyWithImpl<_$ChangeStateEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String version) checkAuth,
    required TResult Function(UserDTO user) logining,
    required TResult Function() exiting,
    required TResult Function() refreshLocal,
    required TResult Function() sendDeviceToken,
    required TResult Function() onboardingSave,
    required TResult Function(AppState state) changeState,
  }) {
    return changeState(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String version)? checkAuth,
    TResult? Function(UserDTO user)? logining,
    TResult? Function()? exiting,
    TResult? Function()? refreshLocal,
    TResult? Function()? sendDeviceToken,
    TResult? Function()? onboardingSave,
    TResult? Function(AppState state)? changeState,
  }) {
    return changeState?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String version)? checkAuth,
    TResult Function(UserDTO user)? logining,
    TResult Function()? exiting,
    TResult Function()? refreshLocal,
    TResult Function()? sendDeviceToken,
    TResult Function()? onboardingSave,
    TResult Function(AppState state)? changeState,
    required TResult orElse(),
  }) {
    if (changeState != null) {
      return changeState(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthEvent value) checkAuth,
    required TResult Function(_LoginingEvent value) logining,
    required TResult Function(_ExitingEvent value) exiting,
    required TResult Function(_RefreshLocalEvent value) refreshLocal,
    required TResult Function(_SendDeviceTokenEvent value) sendDeviceToken,
    required TResult Function(_OnboardingSave value) onboardingSave,
    required TResult Function(_ChangeStateEvent value) changeState,
  }) {
    return changeState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthEvent value)? checkAuth,
    TResult? Function(_LoginingEvent value)? logining,
    TResult? Function(_ExitingEvent value)? exiting,
    TResult? Function(_RefreshLocalEvent value)? refreshLocal,
    TResult? Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult? Function(_OnboardingSave value)? onboardingSave,
    TResult? Function(_ChangeStateEvent value)? changeState,
  }) {
    return changeState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthEvent value)? checkAuth,
    TResult Function(_LoginingEvent value)? logining,
    TResult Function(_ExitingEvent value)? exiting,
    TResult Function(_RefreshLocalEvent value)? refreshLocal,
    TResult Function(_SendDeviceTokenEvent value)? sendDeviceToken,
    TResult Function(_OnboardingSave value)? onboardingSave,
    TResult Function(_ChangeStateEvent value)? changeState,
    required TResult orElse(),
  }) {
    if (changeState != null) {
      return changeState(this);
    }
    return orElse();
  }
}

abstract class _ChangeStateEvent implements AppEvent {
  const factory _ChangeStateEvent({required final AppState state}) =
      _$ChangeStateEventImpl;

  AppState get state;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeStateEventImplCopyWith<_$ChangeStateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() notAuthorized,
    required TResult Function() onboardingState,
    required TResult Function() inApp,
    required TResult Function() notAvailableVersion,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? notAuthorized,
    TResult? Function()? onboardingState,
    TResult? Function()? inApp,
    TResult? Function()? notAvailableVersion,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? notAuthorized,
    TResult Function()? onboardingState,
    TResult Function()? inApp,
    TResult Function()? notAvailableVersion,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAppState value) loading,
    required TResult Function(_NotAuthorizedState value) notAuthorized,
    required TResult Function(_OnboardingState value) onboardingState,
    required TResult Function(_InAppState value) inApp,
    required TResult Function(_NotAvailableVersion value) notAvailableVersion,
    required TResult Function(_ErrorAppState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAppState value)? loading,
    TResult? Function(_NotAuthorizedState value)? notAuthorized,
    TResult? Function(_OnboardingState value)? onboardingState,
    TResult? Function(_InAppState value)? inApp,
    TResult? Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult? Function(_ErrorAppState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAppState value)? loading,
    TResult Function(_NotAuthorizedState value)? notAuthorized,
    TResult Function(_OnboardingState value)? onboardingState,
    TResult Function(_InAppState value)? inApp,
    TResult Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult Function(_ErrorAppState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingAppStateImplCopyWith<$Res> {
  factory _$$LoadingAppStateImplCopyWith(_$LoadingAppStateImpl value,
          $Res Function(_$LoadingAppStateImpl) then) =
      __$$LoadingAppStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingAppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$LoadingAppStateImpl>
    implements _$$LoadingAppStateImplCopyWith<$Res> {
  __$$LoadingAppStateImplCopyWithImpl(
      _$LoadingAppStateImpl _value, $Res Function(_$LoadingAppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingAppStateImpl
    with DiagnosticableTreeMixin
    implements _LoadingAppState {
  const _$LoadingAppStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingAppStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() notAuthorized,
    required TResult Function() onboardingState,
    required TResult Function() inApp,
    required TResult Function() notAvailableVersion,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? notAuthorized,
    TResult? Function()? onboardingState,
    TResult? Function()? inApp,
    TResult? Function()? notAvailableVersion,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? notAuthorized,
    TResult Function()? onboardingState,
    TResult Function()? inApp,
    TResult Function()? notAvailableVersion,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAppState value) loading,
    required TResult Function(_NotAuthorizedState value) notAuthorized,
    required TResult Function(_OnboardingState value) onboardingState,
    required TResult Function(_InAppState value) inApp,
    required TResult Function(_NotAvailableVersion value) notAvailableVersion,
    required TResult Function(_ErrorAppState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAppState value)? loading,
    TResult? Function(_NotAuthorizedState value)? notAuthorized,
    TResult? Function(_OnboardingState value)? onboardingState,
    TResult? Function(_InAppState value)? inApp,
    TResult? Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult? Function(_ErrorAppState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAppState value)? loading,
    TResult Function(_NotAuthorizedState value)? notAuthorized,
    TResult Function(_OnboardingState value)? onboardingState,
    TResult Function(_InAppState value)? inApp,
    TResult Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult Function(_ErrorAppState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingAppState implements AppState {
  const factory _LoadingAppState() = _$LoadingAppStateImpl;
}

/// @nodoc
abstract class _$$NotAuthorizedStateImplCopyWith<$Res> {
  factory _$$NotAuthorizedStateImplCopyWith(_$NotAuthorizedStateImpl value,
          $Res Function(_$NotAuthorizedStateImpl) then) =
      __$$NotAuthorizedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotAuthorizedStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$NotAuthorizedStateImpl>
    implements _$$NotAuthorizedStateImplCopyWith<$Res> {
  __$$NotAuthorizedStateImplCopyWithImpl(_$NotAuthorizedStateImpl _value,
      $Res Function(_$NotAuthorizedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotAuthorizedStateImpl
    with DiagnosticableTreeMixin
    implements _NotAuthorizedState {
  const _$NotAuthorizedStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState.notAuthorized()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppState.notAuthorized'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotAuthorizedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() notAuthorized,
    required TResult Function() onboardingState,
    required TResult Function() inApp,
    required TResult Function() notAvailableVersion,
    required TResult Function(String message) error,
  }) {
    return notAuthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? notAuthorized,
    TResult? Function()? onboardingState,
    TResult? Function()? inApp,
    TResult? Function()? notAvailableVersion,
    TResult? Function(String message)? error,
  }) {
    return notAuthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? notAuthorized,
    TResult Function()? onboardingState,
    TResult Function()? inApp,
    TResult Function()? notAvailableVersion,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (notAuthorized != null) {
      return notAuthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAppState value) loading,
    required TResult Function(_NotAuthorizedState value) notAuthorized,
    required TResult Function(_OnboardingState value) onboardingState,
    required TResult Function(_InAppState value) inApp,
    required TResult Function(_NotAvailableVersion value) notAvailableVersion,
    required TResult Function(_ErrorAppState value) error,
  }) {
    return notAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAppState value)? loading,
    TResult? Function(_NotAuthorizedState value)? notAuthorized,
    TResult? Function(_OnboardingState value)? onboardingState,
    TResult? Function(_InAppState value)? inApp,
    TResult? Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult? Function(_ErrorAppState value)? error,
  }) {
    return notAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAppState value)? loading,
    TResult Function(_NotAuthorizedState value)? notAuthorized,
    TResult Function(_OnboardingState value)? onboardingState,
    TResult Function(_InAppState value)? inApp,
    TResult Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult Function(_ErrorAppState value)? error,
    required TResult orElse(),
  }) {
    if (notAuthorized != null) {
      return notAuthorized(this);
    }
    return orElse();
  }
}

abstract class _NotAuthorizedState implements AppState {
  const factory _NotAuthorizedState() = _$NotAuthorizedStateImpl;
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(_$OnboardingStateImpl value,
          $Res Function(_$OnboardingStateImpl) then) =
      __$$OnboardingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
      _$OnboardingStateImpl _value, $Res Function(_$OnboardingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnboardingStateImpl
    with DiagnosticableTreeMixin
    implements _OnboardingState {
  const _$OnboardingStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState.onboardingState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppState.onboardingState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnboardingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() notAuthorized,
    required TResult Function() onboardingState,
    required TResult Function() inApp,
    required TResult Function() notAvailableVersion,
    required TResult Function(String message) error,
  }) {
    return onboardingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? notAuthorized,
    TResult? Function()? onboardingState,
    TResult? Function()? inApp,
    TResult? Function()? notAvailableVersion,
    TResult? Function(String message)? error,
  }) {
    return onboardingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? notAuthorized,
    TResult Function()? onboardingState,
    TResult Function()? inApp,
    TResult Function()? notAvailableVersion,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (onboardingState != null) {
      return onboardingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAppState value) loading,
    required TResult Function(_NotAuthorizedState value) notAuthorized,
    required TResult Function(_OnboardingState value) onboardingState,
    required TResult Function(_InAppState value) inApp,
    required TResult Function(_NotAvailableVersion value) notAvailableVersion,
    required TResult Function(_ErrorAppState value) error,
  }) {
    return onboardingState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAppState value)? loading,
    TResult? Function(_NotAuthorizedState value)? notAuthorized,
    TResult? Function(_OnboardingState value)? onboardingState,
    TResult? Function(_InAppState value)? inApp,
    TResult? Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult? Function(_ErrorAppState value)? error,
  }) {
    return onboardingState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAppState value)? loading,
    TResult Function(_NotAuthorizedState value)? notAuthorized,
    TResult Function(_OnboardingState value)? onboardingState,
    TResult Function(_InAppState value)? inApp,
    TResult Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult Function(_ErrorAppState value)? error,
    required TResult orElse(),
  }) {
    if (onboardingState != null) {
      return onboardingState(this);
    }
    return orElse();
  }
}

abstract class _OnboardingState implements AppState {
  const factory _OnboardingState() = _$OnboardingStateImpl;
}

/// @nodoc
abstract class _$$InAppStateImplCopyWith<$Res> {
  factory _$$InAppStateImplCopyWith(
          _$InAppStateImpl value, $Res Function(_$InAppStateImpl) then) =
      __$$InAppStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InAppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$InAppStateImpl>
    implements _$$InAppStateImplCopyWith<$Res> {
  __$$InAppStateImplCopyWithImpl(
      _$InAppStateImpl _value, $Res Function(_$InAppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InAppStateImpl with DiagnosticableTreeMixin implements _InAppState {
  const _$InAppStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState.inApp()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppState.inApp'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InAppStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() notAuthorized,
    required TResult Function() onboardingState,
    required TResult Function() inApp,
    required TResult Function() notAvailableVersion,
    required TResult Function(String message) error,
  }) {
    return inApp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? notAuthorized,
    TResult? Function()? onboardingState,
    TResult? Function()? inApp,
    TResult? Function()? notAvailableVersion,
    TResult? Function(String message)? error,
  }) {
    return inApp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? notAuthorized,
    TResult Function()? onboardingState,
    TResult Function()? inApp,
    TResult Function()? notAvailableVersion,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (inApp != null) {
      return inApp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAppState value) loading,
    required TResult Function(_NotAuthorizedState value) notAuthorized,
    required TResult Function(_OnboardingState value) onboardingState,
    required TResult Function(_InAppState value) inApp,
    required TResult Function(_NotAvailableVersion value) notAvailableVersion,
    required TResult Function(_ErrorAppState value) error,
  }) {
    return inApp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAppState value)? loading,
    TResult? Function(_NotAuthorizedState value)? notAuthorized,
    TResult? Function(_OnboardingState value)? onboardingState,
    TResult? Function(_InAppState value)? inApp,
    TResult? Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult? Function(_ErrorAppState value)? error,
  }) {
    return inApp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAppState value)? loading,
    TResult Function(_NotAuthorizedState value)? notAuthorized,
    TResult Function(_OnboardingState value)? onboardingState,
    TResult Function(_InAppState value)? inApp,
    TResult Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult Function(_ErrorAppState value)? error,
    required TResult orElse(),
  }) {
    if (inApp != null) {
      return inApp(this);
    }
    return orElse();
  }
}

abstract class _InAppState implements AppState {
  const factory _InAppState() = _$InAppStateImpl;
}

/// @nodoc
abstract class _$$NotAvailableVersionImplCopyWith<$Res> {
  factory _$$NotAvailableVersionImplCopyWith(_$NotAvailableVersionImpl value,
          $Res Function(_$NotAvailableVersionImpl) then) =
      __$$NotAvailableVersionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotAvailableVersionImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$NotAvailableVersionImpl>
    implements _$$NotAvailableVersionImplCopyWith<$Res> {
  __$$NotAvailableVersionImplCopyWithImpl(_$NotAvailableVersionImpl _value,
      $Res Function(_$NotAvailableVersionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotAvailableVersionImpl
    with DiagnosticableTreeMixin
    implements _NotAvailableVersion {
  const _$NotAvailableVersionImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState.notAvailableVersion()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState.notAvailableVersion'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotAvailableVersionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() notAuthorized,
    required TResult Function() onboardingState,
    required TResult Function() inApp,
    required TResult Function() notAvailableVersion,
    required TResult Function(String message) error,
  }) {
    return notAvailableVersion();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? notAuthorized,
    TResult? Function()? onboardingState,
    TResult? Function()? inApp,
    TResult? Function()? notAvailableVersion,
    TResult? Function(String message)? error,
  }) {
    return notAvailableVersion?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? notAuthorized,
    TResult Function()? onboardingState,
    TResult Function()? inApp,
    TResult Function()? notAvailableVersion,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (notAvailableVersion != null) {
      return notAvailableVersion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAppState value) loading,
    required TResult Function(_NotAuthorizedState value) notAuthorized,
    required TResult Function(_OnboardingState value) onboardingState,
    required TResult Function(_InAppState value) inApp,
    required TResult Function(_NotAvailableVersion value) notAvailableVersion,
    required TResult Function(_ErrorAppState value) error,
  }) {
    return notAvailableVersion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAppState value)? loading,
    TResult? Function(_NotAuthorizedState value)? notAuthorized,
    TResult? Function(_OnboardingState value)? onboardingState,
    TResult? Function(_InAppState value)? inApp,
    TResult? Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult? Function(_ErrorAppState value)? error,
  }) {
    return notAvailableVersion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAppState value)? loading,
    TResult Function(_NotAuthorizedState value)? notAuthorized,
    TResult Function(_OnboardingState value)? onboardingState,
    TResult Function(_InAppState value)? inApp,
    TResult Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult Function(_ErrorAppState value)? error,
    required TResult orElse(),
  }) {
    if (notAvailableVersion != null) {
      return notAvailableVersion(this);
    }
    return orElse();
  }
}

abstract class _NotAvailableVersion implements AppState {
  const factory _NotAvailableVersion() = _$NotAvailableVersionImpl;
}

/// @nodoc
abstract class _$$ErrorAppStateImplCopyWith<$Res> {
  factory _$$ErrorAppStateImplCopyWith(
          _$ErrorAppStateImpl value, $Res Function(_$ErrorAppStateImpl) then) =
      __$$ErrorAppStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorAppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$ErrorAppStateImpl>
    implements _$$ErrorAppStateImplCopyWith<$Res> {
  __$$ErrorAppStateImplCopyWithImpl(
      _$ErrorAppStateImpl _value, $Res Function(_$ErrorAppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorAppStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorAppStateImpl
    with DiagnosticableTreeMixin
    implements _ErrorAppState {
  const _$ErrorAppStateImpl({required this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorAppStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorAppStateImplCopyWith<_$ErrorAppStateImpl> get copyWith =>
      __$$ErrorAppStateImplCopyWithImpl<_$ErrorAppStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() notAuthorized,
    required TResult Function() onboardingState,
    required TResult Function() inApp,
    required TResult Function() notAvailableVersion,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? notAuthorized,
    TResult? Function()? onboardingState,
    TResult? Function()? inApp,
    TResult? Function()? notAvailableVersion,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? notAuthorized,
    TResult Function()? onboardingState,
    TResult Function()? inApp,
    TResult Function()? notAvailableVersion,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAppState value) loading,
    required TResult Function(_NotAuthorizedState value) notAuthorized,
    required TResult Function(_OnboardingState value) onboardingState,
    required TResult Function(_InAppState value) inApp,
    required TResult Function(_NotAvailableVersion value) notAvailableVersion,
    required TResult Function(_ErrorAppState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAppState value)? loading,
    TResult? Function(_NotAuthorizedState value)? notAuthorized,
    TResult? Function(_OnboardingState value)? onboardingState,
    TResult? Function(_InAppState value)? inApp,
    TResult? Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult? Function(_ErrorAppState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAppState value)? loading,
    TResult Function(_NotAuthorizedState value)? notAuthorized,
    TResult Function(_OnboardingState value)? onboardingState,
    TResult Function(_InAppState value)? inApp,
    TResult Function(_NotAvailableVersion value)? notAvailableVersion,
    TResult Function(_ErrorAppState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorAppState implements AppState {
  const factory _ErrorAppState({required final String message}) =
      _$ErrorAppStateImpl;

  String get message;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorAppStateImplCopyWith<_$ErrorAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
