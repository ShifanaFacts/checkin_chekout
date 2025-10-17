// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String logingId, String password) performLogin,
    required TResult Function(BuildContext context) performUserLogout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String logingId, String password)? performLogin,
    TResult? Function(BuildContext context)? performUserLogout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String logingId, String password)? performLogin,
    TResult Function(BuildContext context)? performUserLogout,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(PerformLogin value) performLogin,
    required TResult Function(PerformUserLogout value) performUserLogout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(PerformLogin value)? performLogin,
    TResult? Function(PerformUserLogout value)? performUserLogout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(PerformLogin value)? performLogin,
    TResult Function(PerformUserLogout value)? performUserLogout,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
    LoginEvent value,
    $Res Function(LoginEvent) then,
  ) = _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
    _$InitializeImpl value,
    $Res Function(_$InitializeImpl) then,
  ) = __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
    _$InitializeImpl _value,
    $Res Function(_$InitializeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'LoginEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String logingId, String password) performLogin,
    required TResult Function(BuildContext context) performUserLogout,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String logingId, String password)? performLogin,
    TResult? Function(BuildContext context)? performUserLogout,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String logingId, String password)? performLogin,
    TResult Function(BuildContext context)? performUserLogout,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(PerformLogin value) performLogin,
    required TResult Function(PerformUserLogout value) performUserLogout,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(PerformLogin value)? performLogin,
    TResult? Function(PerformUserLogout value)? performUserLogout,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(PerformLogin value)? performLogin,
    TResult Function(PerformUserLogout value)? performUserLogout,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements LoginEvent {
  const factory Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$PerformLoginImplCopyWith<$Res> {
  factory _$$PerformLoginImplCopyWith(
    _$PerformLoginImpl value,
    $Res Function(_$PerformLoginImpl) then,
  ) = __$$PerformLoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String logingId, String password});
}

/// @nodoc
class __$$PerformLoginImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$PerformLoginImpl>
    implements _$$PerformLoginImplCopyWith<$Res> {
  __$$PerformLoginImplCopyWithImpl(
    _$PerformLoginImpl _value,
    $Res Function(_$PerformLoginImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? logingId = null, Object? password = null}) {
    return _then(
      _$PerformLoginImpl(
        logingId: null == logingId
            ? _value.logingId
            : logingId // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PerformLoginImpl implements PerformLogin {
  const _$PerformLoginImpl({required this.logingId, required this.password});

  @override
  final String logingId;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.performLogin(logingId: $logingId, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformLoginImpl &&
            (identical(other.logingId, logingId) ||
                other.logingId == logingId) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, logingId, password);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformLoginImplCopyWith<_$PerformLoginImpl> get copyWith =>
      __$$PerformLoginImplCopyWithImpl<_$PerformLoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String logingId, String password) performLogin,
    required TResult Function(BuildContext context) performUserLogout,
  }) {
    return performLogin(logingId, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String logingId, String password)? performLogin,
    TResult? Function(BuildContext context)? performUserLogout,
  }) {
    return performLogin?.call(logingId, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String logingId, String password)? performLogin,
    TResult Function(BuildContext context)? performUserLogout,
    required TResult orElse(),
  }) {
    if (performLogin != null) {
      return performLogin(logingId, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(PerformLogin value) performLogin,
    required TResult Function(PerformUserLogout value) performUserLogout,
  }) {
    return performLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(PerformLogin value)? performLogin,
    TResult? Function(PerformUserLogout value)? performUserLogout,
  }) {
    return performLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(PerformLogin value)? performLogin,
    TResult Function(PerformUserLogout value)? performUserLogout,
    required TResult orElse(),
  }) {
    if (performLogin != null) {
      return performLogin(this);
    }
    return orElse();
  }
}

abstract class PerformLogin implements LoginEvent {
  const factory PerformLogin({
    required final String logingId,
    required final String password,
  }) = _$PerformLoginImpl;

  String get logingId;
  String get password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformLoginImplCopyWith<_$PerformLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PerformUserLogoutImplCopyWith<$Res> {
  factory _$$PerformUserLogoutImplCopyWith(
    _$PerformUserLogoutImpl value,
    $Res Function(_$PerformUserLogoutImpl) then,
  ) = __$$PerformUserLogoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$PerformUserLogoutImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$PerformUserLogoutImpl>
    implements _$$PerformUserLogoutImplCopyWith<$Res> {
  __$$PerformUserLogoutImplCopyWithImpl(
    _$PerformUserLogoutImpl _value,
    $Res Function(_$PerformUserLogoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? context = null}) {
    return _then(
      _$PerformUserLogoutImpl(
        context: null == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as BuildContext,
      ),
    );
  }
}

/// @nodoc

class _$PerformUserLogoutImpl implements PerformUserLogout {
  const _$PerformUserLogoutImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'LoginEvent.performUserLogout(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformUserLogoutImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformUserLogoutImplCopyWith<_$PerformUserLogoutImpl> get copyWith =>
      __$$PerformUserLogoutImplCopyWithImpl<_$PerformUserLogoutImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String logingId, String password) performLogin,
    required TResult Function(BuildContext context) performUserLogout,
  }) {
    return performUserLogout(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String logingId, String password)? performLogin,
    TResult? Function(BuildContext context)? performUserLogout,
  }) {
    return performUserLogout?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String logingId, String password)? performLogin,
    TResult Function(BuildContext context)? performUserLogout,
    required TResult orElse(),
  }) {
    if (performUserLogout != null) {
      return performUserLogout(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(PerformLogin value) performLogin,
    required TResult Function(PerformUserLogout value) performUserLogout,
  }) {
    return performUserLogout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(PerformLogin value)? performLogin,
    TResult? Function(PerformUserLogout value)? performUserLogout,
  }) {
    return performUserLogout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(PerformLogin value)? performLogin,
    TResult Function(PerformUserLogout value)? performUserLogout,
    required TResult orElse(),
  }) {
    if (performUserLogout != null) {
      return performUserLogout(this);
    }
    return orElse();
  }
}

abstract class PerformUserLogout implements LoginEvent {
  const factory PerformUserLogout({required final BuildContext context}) =
      _$PerformUserLogoutImpl;

  BuildContext get context;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformUserLogoutImplCopyWith<_$PerformUserLogoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginState {
  LoginModel? get loginModel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get loginSucceeded => throw _privateConstructorUsedError;
  bool get deviceValidation => throw _privateConstructorUsedError;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
    LoginState value,
    $Res Function(LoginState) then,
  ) = _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call({
    LoginModel? loginModel,
    bool isLoading,
    bool isError,
    bool loginSucceeded,
    bool deviceValidation,
  });
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginModel = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? loginSucceeded = null,
    Object? deviceValidation = null,
  }) {
    return _then(
      _value.copyWith(
            loginModel: freezed == loginModel
                ? _value.loginModel
                : loginModel // ignore: cast_nullable_to_non_nullable
                      as LoginModel?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isError: null == isError
                ? _value.isError
                : isError // ignore: cast_nullable_to_non_nullable
                      as bool,
            loginSucceeded: null == loginSucceeded
                ? _value.loginSucceeded
                : loginSucceeded // ignore: cast_nullable_to_non_nullable
                      as bool,
            deviceValidation: null == deviceValidation
                ? _value.deviceValidation
                : deviceValidation // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
    _$LoginStateImpl value,
    $Res Function(_$LoginStateImpl) then,
  ) = __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    LoginModel? loginModel,
    bool isLoading,
    bool isError,
    bool loginSucceeded,
    bool deviceValidation,
  });
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
    _$LoginStateImpl _value,
    $Res Function(_$LoginStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginModel = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? loginSucceeded = null,
    Object? deviceValidation = null,
  }) {
    return _then(
      _$LoginStateImpl(
        loginModel: freezed == loginModel
            ? _value.loginModel
            : loginModel // ignore: cast_nullable_to_non_nullable
                  as LoginModel?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isError: null == isError
            ? _value.isError
            : isError // ignore: cast_nullable_to_non_nullable
                  as bool,
        loginSucceeded: null == loginSucceeded
            ? _value.loginSucceeded
            : loginSucceeded // ignore: cast_nullable_to_non_nullable
                  as bool,
        deviceValidation: null == deviceValidation
            ? _value.deviceValidation
            : deviceValidation // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  const _$LoginStateImpl({
    this.loginModel,
    required this.isLoading,
    required this.isError,
    required this.loginSucceeded,
    required this.deviceValidation,
  });

  @override
  final LoginModel? loginModel;
  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final bool loginSucceeded;
  @override
  final bool deviceValidation;

  @override
  String toString() {
    return 'LoginState(loginModel: $loginModel, isLoading: $isLoading, isError: $isError, loginSucceeded: $loginSucceeded, deviceValidation: $deviceValidation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.loginModel, loginModel) ||
                other.loginModel == loginModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.loginSucceeded, loginSucceeded) ||
                other.loginSucceeded == loginSucceeded) &&
            (identical(other.deviceValidation, deviceValidation) ||
                other.deviceValidation == deviceValidation));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loginModel,
    isLoading,
    isError,
    loginSucceeded,
    deviceValidation,
  );

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState({
    final LoginModel? loginModel,
    required final bool isLoading,
    required final bool isError,
    required final bool loginSucceeded,
    required final bool deviceValidation,
  }) = _$LoginStateImpl;

  @override
  LoginModel? get loginModel;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get loginSucceeded;
  @override
  bool get deviceValidation;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
