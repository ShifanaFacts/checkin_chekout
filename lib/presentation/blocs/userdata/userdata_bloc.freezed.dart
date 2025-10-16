// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userdata_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserdataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String logingId) getUserData,
    required TResult Function(String logingId, String token) postUserFCMToken,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String logingId)? getUserData,
    TResult? Function(String logingId, String token)? postUserFCMToken,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String logingId)? getUserData,
    TResult Function(String logingId, String token)? postUserFCMToken,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(GetUserData value) getUserData,
    required TResult Function(PostUserFCMToken value) postUserFCMToken,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(GetUserData value)? getUserData,
    TResult? Function(PostUserFCMToken value)? postUserFCMToken,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(GetUserData value)? getUserData,
    TResult Function(PostUserFCMToken value)? postUserFCMToken,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserdataEventCopyWith<$Res> {
  factory $UserdataEventCopyWith(
    UserdataEvent value,
    $Res Function(UserdataEvent) then,
  ) = _$UserdataEventCopyWithImpl<$Res, UserdataEvent>;
}

/// @nodoc
class _$UserdataEventCopyWithImpl<$Res, $Val extends UserdataEvent>
    implements $UserdataEventCopyWith<$Res> {
  _$UserdataEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserdataEvent
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
    extends _$UserdataEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
    _$InitializeImpl _value,
    $Res Function(_$InitializeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserdataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl with DiagnosticableTreeMixin implements Initialize {
  const _$InitializeImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserdataEvent.initialize()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UserdataEvent.initialize'));
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
    required TResult Function(String logingId) getUserData,
    required TResult Function(String logingId, String token) postUserFCMToken,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String logingId)? getUserData,
    TResult? Function(String logingId, String token)? postUserFCMToken,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String logingId)? getUserData,
    TResult Function(String logingId, String token)? postUserFCMToken,
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
    required TResult Function(GetUserData value) getUserData,
    required TResult Function(PostUserFCMToken value) postUserFCMToken,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(GetUserData value)? getUserData,
    TResult? Function(PostUserFCMToken value)? postUserFCMToken,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(GetUserData value)? getUserData,
    TResult Function(PostUserFCMToken value)? postUserFCMToken,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements UserdataEvent {
  const factory Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$GetUserDataImplCopyWith<$Res> {
  factory _$$GetUserDataImplCopyWith(
    _$GetUserDataImpl value,
    $Res Function(_$GetUserDataImpl) then,
  ) = __$$GetUserDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String logingId});
}

/// @nodoc
class __$$GetUserDataImplCopyWithImpl<$Res>
    extends _$UserdataEventCopyWithImpl<$Res, _$GetUserDataImpl>
    implements _$$GetUserDataImplCopyWith<$Res> {
  __$$GetUserDataImplCopyWithImpl(
    _$GetUserDataImpl _value,
    $Res Function(_$GetUserDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? logingId = null}) {
    return _then(
      _$GetUserDataImpl(
        logingId: null == logingId
            ? _value.logingId
            : logingId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GetUserDataImpl with DiagnosticableTreeMixin implements GetUserData {
  const _$GetUserDataImpl({required this.logingId});

  @override
  final String logingId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserdataEvent.getUserData(logingId: $logingId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserdataEvent.getUserData'))
      ..add(DiagnosticsProperty('logingId', logingId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserDataImpl &&
            (identical(other.logingId, logingId) ||
                other.logingId == logingId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, logingId);

  /// Create a copy of UserdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserDataImplCopyWith<_$GetUserDataImpl> get copyWith =>
      __$$GetUserDataImplCopyWithImpl<_$GetUserDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String logingId) getUserData,
    required TResult Function(String logingId, String token) postUserFCMToken,
  }) {
    return getUserData(logingId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String logingId)? getUserData,
    TResult? Function(String logingId, String token)? postUserFCMToken,
  }) {
    return getUserData?.call(logingId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String logingId)? getUserData,
    TResult Function(String logingId, String token)? postUserFCMToken,
    required TResult orElse(),
  }) {
    if (getUserData != null) {
      return getUserData(logingId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(GetUserData value) getUserData,
    required TResult Function(PostUserFCMToken value) postUserFCMToken,
  }) {
    return getUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(GetUserData value)? getUserData,
    TResult? Function(PostUserFCMToken value)? postUserFCMToken,
  }) {
    return getUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(GetUserData value)? getUserData,
    TResult Function(PostUserFCMToken value)? postUserFCMToken,
    required TResult orElse(),
  }) {
    if (getUserData != null) {
      return getUserData(this);
    }
    return orElse();
  }
}

abstract class GetUserData implements UserdataEvent {
  const factory GetUserData({required final String logingId}) =
      _$GetUserDataImpl;

  String get logingId;

  /// Create a copy of UserdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserDataImplCopyWith<_$GetUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostUserFCMTokenImplCopyWith<$Res> {
  factory _$$PostUserFCMTokenImplCopyWith(
    _$PostUserFCMTokenImpl value,
    $Res Function(_$PostUserFCMTokenImpl) then,
  ) = __$$PostUserFCMTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String logingId, String token});
}

/// @nodoc
class __$$PostUserFCMTokenImplCopyWithImpl<$Res>
    extends _$UserdataEventCopyWithImpl<$Res, _$PostUserFCMTokenImpl>
    implements _$$PostUserFCMTokenImplCopyWith<$Res> {
  __$$PostUserFCMTokenImplCopyWithImpl(
    _$PostUserFCMTokenImpl _value,
    $Res Function(_$PostUserFCMTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? logingId = null, Object? token = null}) {
    return _then(
      _$PostUserFCMTokenImpl(
        logingId: null == logingId
            ? _value.logingId
            : logingId // ignore: cast_nullable_to_non_nullable
                  as String,
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PostUserFCMTokenImpl
    with DiagnosticableTreeMixin
    implements PostUserFCMToken {
  const _$PostUserFCMTokenImpl({required this.logingId, required this.token});

  @override
  final String logingId;
  @override
  final String token;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserdataEvent.postUserFCMToken(logingId: $logingId, token: $token)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserdataEvent.postUserFCMToken'))
      ..add(DiagnosticsProperty('logingId', logingId))
      ..add(DiagnosticsProperty('token', token));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostUserFCMTokenImpl &&
            (identical(other.logingId, logingId) ||
                other.logingId == logingId) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, logingId, token);

  /// Create a copy of UserdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostUserFCMTokenImplCopyWith<_$PostUserFCMTokenImpl> get copyWith =>
      __$$PostUserFCMTokenImplCopyWithImpl<_$PostUserFCMTokenImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String logingId) getUserData,
    required TResult Function(String logingId, String token) postUserFCMToken,
  }) {
    return postUserFCMToken(logingId, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String logingId)? getUserData,
    TResult? Function(String logingId, String token)? postUserFCMToken,
  }) {
    return postUserFCMToken?.call(logingId, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String logingId)? getUserData,
    TResult Function(String logingId, String token)? postUserFCMToken,
    required TResult orElse(),
  }) {
    if (postUserFCMToken != null) {
      return postUserFCMToken(logingId, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(GetUserData value) getUserData,
    required TResult Function(PostUserFCMToken value) postUserFCMToken,
  }) {
    return postUserFCMToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(GetUserData value)? getUserData,
    TResult? Function(PostUserFCMToken value)? postUserFCMToken,
  }) {
    return postUserFCMToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(GetUserData value)? getUserData,
    TResult Function(PostUserFCMToken value)? postUserFCMToken,
    required TResult orElse(),
  }) {
    if (postUserFCMToken != null) {
      return postUserFCMToken(this);
    }
    return orElse();
  }
}

abstract class PostUserFCMToken implements UserdataEvent {
  const factory PostUserFCMToken({
    required final String logingId,
    required final String token,
  }) = _$PostUserFCMTokenImpl;

  String get logingId;
  String get token;

  /// Create a copy of UserdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostUserFCMTokenImplCopyWith<_$PostUserFCMTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserdataState {
  UserDataModel? get userModel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get datafetched => throw _privateConstructorUsedError;
  List<BottomNavigationBarItem> get btmNavitems =>
      throw _privateConstructorUsedError;
  List<Widget> get screens => throw _privateConstructorUsedError;

  /// Create a copy of UserdataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserdataStateCopyWith<UserdataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserdataStateCopyWith<$Res> {
  factory $UserdataStateCopyWith(
    UserdataState value,
    $Res Function(UserdataState) then,
  ) = _$UserdataStateCopyWithImpl<$Res, UserdataState>;
  @useResult
  $Res call({
    UserDataModel? userModel,
    bool isLoading,
    bool isError,
    bool datafetched,
    List<BottomNavigationBarItem> btmNavitems,
    List<Widget> screens,
  });
}

/// @nodoc
class _$UserdataStateCopyWithImpl<$Res, $Val extends UserdataState>
    implements $UserdataStateCopyWith<$Res> {
  _$UserdataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserdataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? datafetched = null,
    Object? btmNavitems = null,
    Object? screens = null,
  }) {
    return _then(
      _value.copyWith(
            userModel: freezed == userModel
                ? _value.userModel
                : userModel // ignore: cast_nullable_to_non_nullable
                      as UserDataModel?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isError: null == isError
                ? _value.isError
                : isError // ignore: cast_nullable_to_non_nullable
                      as bool,
            datafetched: null == datafetched
                ? _value.datafetched
                : datafetched // ignore: cast_nullable_to_non_nullable
                      as bool,
            btmNavitems: null == btmNavitems
                ? _value.btmNavitems
                : btmNavitems // ignore: cast_nullable_to_non_nullable
                      as List<BottomNavigationBarItem>,
            screens: null == screens
                ? _value.screens
                : screens // ignore: cast_nullable_to_non_nullable
                      as List<Widget>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserdataStateImplCopyWith<$Res>
    implements $UserdataStateCopyWith<$Res> {
  factory _$$UserdataStateImplCopyWith(
    _$UserdataStateImpl value,
    $Res Function(_$UserdataStateImpl) then,
  ) = __$$UserdataStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserDataModel? userModel,
    bool isLoading,
    bool isError,
    bool datafetched,
    List<BottomNavigationBarItem> btmNavitems,
    List<Widget> screens,
  });
}

/// @nodoc
class __$$UserdataStateImplCopyWithImpl<$Res>
    extends _$UserdataStateCopyWithImpl<$Res, _$UserdataStateImpl>
    implements _$$UserdataStateImplCopyWith<$Res> {
  __$$UserdataStateImplCopyWithImpl(
    _$UserdataStateImpl _value,
    $Res Function(_$UserdataStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserdataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? datafetched = null,
    Object? btmNavitems = null,
    Object? screens = null,
  }) {
    return _then(
      _$UserdataStateImpl(
        userModel: freezed == userModel
            ? _value.userModel
            : userModel // ignore: cast_nullable_to_non_nullable
                  as UserDataModel?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isError: null == isError
            ? _value.isError
            : isError // ignore: cast_nullable_to_non_nullable
                  as bool,
        datafetched: null == datafetched
            ? _value.datafetched
            : datafetched // ignore: cast_nullable_to_non_nullable
                  as bool,
        btmNavitems: null == btmNavitems
            ? _value._btmNavitems
            : btmNavitems // ignore: cast_nullable_to_non_nullable
                  as List<BottomNavigationBarItem>,
        screens: null == screens
            ? _value._screens
            : screens // ignore: cast_nullable_to_non_nullable
                  as List<Widget>,
      ),
    );
  }
}

/// @nodoc

class _$UserdataStateImpl
    with DiagnosticableTreeMixin
    implements _UserdataState {
  const _$UserdataStateImpl({
    this.userModel,
    required this.isLoading,
    required this.isError,
    required this.datafetched,
    required final List<BottomNavigationBarItem> btmNavitems,
    required final List<Widget> screens,
  }) : _btmNavitems = btmNavitems,
       _screens = screens;

  @override
  final UserDataModel? userModel;
  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final bool datafetched;
  final List<BottomNavigationBarItem> _btmNavitems;
  @override
  List<BottomNavigationBarItem> get btmNavitems {
    if (_btmNavitems is EqualUnmodifiableListView) return _btmNavitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_btmNavitems);
  }

  final List<Widget> _screens;
  @override
  List<Widget> get screens {
    if (_screens is EqualUnmodifiableListView) return _screens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_screens);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserdataState(userModel: $userModel, isLoading: $isLoading, isError: $isError, datafetched: $datafetched, btmNavitems: $btmNavitems, screens: $screens)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserdataState'))
      ..add(DiagnosticsProperty('userModel', userModel))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isError', isError))
      ..add(DiagnosticsProperty('datafetched', datafetched))
      ..add(DiagnosticsProperty('btmNavitems', btmNavitems))
      ..add(DiagnosticsProperty('screens', screens));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserdataStateImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.datafetched, datafetched) ||
                other.datafetched == datafetched) &&
            const DeepCollectionEquality().equals(
              other._btmNavitems,
              _btmNavitems,
            ) &&
            const DeepCollectionEquality().equals(other._screens, _screens));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    userModel,
    isLoading,
    isError,
    datafetched,
    const DeepCollectionEquality().hash(_btmNavitems),
    const DeepCollectionEquality().hash(_screens),
  );

  /// Create a copy of UserdataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserdataStateImplCopyWith<_$UserdataStateImpl> get copyWith =>
      __$$UserdataStateImplCopyWithImpl<_$UserdataStateImpl>(this, _$identity);
}

abstract class _UserdataState implements UserdataState {
  const factory _UserdataState({
    final UserDataModel? userModel,
    required final bool isLoading,
    required final bool isError,
    required final bool datafetched,
    required final List<BottomNavigationBarItem> btmNavitems,
    required final List<Widget> screens,
  }) = _$UserdataStateImpl;

  @override
  UserDataModel? get userModel;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get datafetched;
  @override
  List<BottomNavigationBarItem> get btmNavitems;
  @override
  List<Widget> get screens;

  /// Create a copy of UserdataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserdataStateImplCopyWith<_$UserdataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
