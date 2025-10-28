// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_checkin_checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserCheckinCheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )
    getCheckinData,
    required TResult Function(String checkinTime) getCheckOutData,
    required TResult Function(String checkinTime) getTechnicianCheckInDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult? Function(String checkinTime)? getCheckOutData,
    TResult? Function(String checkinTime)? getTechnicianCheckInDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult Function(String checkinTime)? getCheckOutData,
    TResult Function(String checkinTime)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetCheckinData value) getCheckinData,
    required TResult Function(GetCheckOutData value) getCheckOutData,
    required TResult Function(GetCheckInDetails value)
    getTechnicianCheckInDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetCheckinData value)? getCheckinData,
    TResult? Function(GetCheckOutData value)? getCheckOutData,
    TResult? Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetCheckinData value)? getCheckinData,
    TResult Function(GetCheckOutData value)? getCheckOutData,
    TResult Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCheckinCheckoutEventCopyWith<$Res> {
  factory $UserCheckinCheckoutEventCopyWith(
    UserCheckinCheckoutEvent value,
    $Res Function(UserCheckinCheckoutEvent) then,
  ) = _$UserCheckinCheckoutEventCopyWithImpl<$Res, UserCheckinCheckoutEvent>;
}

/// @nodoc
class _$UserCheckinCheckoutEventCopyWithImpl<
  $Res,
  $Val extends UserCheckinCheckoutEvent
>
    implements $UserCheckinCheckoutEventCopyWith<$Res> {
  _$UserCheckinCheckoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$UserCheckinCheckoutEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserCheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UserCheckinCheckoutEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )
    getCheckinData,
    required TResult Function(String checkinTime) getCheckOutData,
    required TResult Function(String checkinTime) getTechnicianCheckInDetails,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult? Function(String checkinTime)? getCheckOutData,
    TResult? Function(String checkinTime)? getTechnicianCheckInDetails,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult Function(String checkinTime)? getCheckOutData,
    TResult Function(String checkinTime)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetCheckinData value) getCheckinData,
    required TResult Function(GetCheckOutData value) getCheckOutData,
    required TResult Function(GetCheckInDetails value)
    getTechnicianCheckInDetails,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetCheckinData value)? getCheckinData,
    TResult? Function(GetCheckOutData value)? getCheckOutData,
    TResult? Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetCheckinData value)? getCheckinData,
    TResult Function(GetCheckOutData value)? getCheckOutData,
    TResult Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UserCheckinCheckoutEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetCheckinDataImplCopyWith<$Res> {
  factory _$$GetCheckinDataImplCopyWith(
    _$GetCheckinDataImpl value,
    $Res Function(_$GetCheckinDataImpl) then,
  ) = __$$GetCheckinDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, String> dropDownSelectionObject, String checkinTime});
}

/// @nodoc
class __$$GetCheckinDataImplCopyWithImpl<$Res>
    extends _$UserCheckinCheckoutEventCopyWithImpl<$Res, _$GetCheckinDataImpl>
    implements _$$GetCheckinDataImplCopyWith<$Res> {
  __$$GetCheckinDataImplCopyWithImpl(
    _$GetCheckinDataImpl _value,
    $Res Function(_$GetCheckinDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserCheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dropDownSelectionObject = null,
    Object? checkinTime = null,
  }) {
    return _then(
      _$GetCheckinDataImpl(
        dropDownSelectionObject: null == dropDownSelectionObject
            ? _value._dropDownSelectionObject
            : dropDownSelectionObject // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        checkinTime: null == checkinTime
            ? _value.checkinTime
            : checkinTime // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GetCheckinDataImpl implements GetCheckinData {
  const _$GetCheckinDataImpl({
    required final Map<String, String> dropDownSelectionObject,
    required this.checkinTime,
  }) : _dropDownSelectionObject = dropDownSelectionObject;

  final Map<String, String> _dropDownSelectionObject;
  @override
  Map<String, String> get dropDownSelectionObject {
    if (_dropDownSelectionObject is EqualUnmodifiableMapView)
      return _dropDownSelectionObject;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dropDownSelectionObject);
  }

  @override
  final String checkinTime;

  @override
  String toString() {
    return 'UserCheckinCheckoutEvent.getCheckinData(dropDownSelectionObject: $dropDownSelectionObject, checkinTime: $checkinTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCheckinDataImpl &&
            const DeepCollectionEquality().equals(
              other._dropDownSelectionObject,
              _dropDownSelectionObject,
            ) &&
            (identical(other.checkinTime, checkinTime) ||
                other.checkinTime == checkinTime));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_dropDownSelectionObject),
    checkinTime,
  );

  /// Create a copy of UserCheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCheckinDataImplCopyWith<_$GetCheckinDataImpl> get copyWith =>
      __$$GetCheckinDataImplCopyWithImpl<_$GetCheckinDataImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )
    getCheckinData,
    required TResult Function(String checkinTime) getCheckOutData,
    required TResult Function(String checkinTime) getTechnicianCheckInDetails,
  }) {
    return getCheckinData(dropDownSelectionObject, checkinTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult? Function(String checkinTime)? getCheckOutData,
    TResult? Function(String checkinTime)? getTechnicianCheckInDetails,
  }) {
    return getCheckinData?.call(dropDownSelectionObject, checkinTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult Function(String checkinTime)? getCheckOutData,
    TResult Function(String checkinTime)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) {
    if (getCheckinData != null) {
      return getCheckinData(dropDownSelectionObject, checkinTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetCheckinData value) getCheckinData,
    required TResult Function(GetCheckOutData value) getCheckOutData,
    required TResult Function(GetCheckInDetails value)
    getTechnicianCheckInDetails,
  }) {
    return getCheckinData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetCheckinData value)? getCheckinData,
    TResult? Function(GetCheckOutData value)? getCheckOutData,
    TResult? Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
  }) {
    return getCheckinData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetCheckinData value)? getCheckinData,
    TResult Function(GetCheckOutData value)? getCheckOutData,
    TResult Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) {
    if (getCheckinData != null) {
      return getCheckinData(this);
    }
    return orElse();
  }
}

abstract class GetCheckinData implements UserCheckinCheckoutEvent {
  const factory GetCheckinData({
    required final Map<String, String> dropDownSelectionObject,
    required final String checkinTime,
  }) = _$GetCheckinDataImpl;

  Map<String, String> get dropDownSelectionObject;
  String get checkinTime;

  /// Create a copy of UserCheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCheckinDataImplCopyWith<_$GetCheckinDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCheckOutDataImplCopyWith<$Res> {
  factory _$$GetCheckOutDataImplCopyWith(
    _$GetCheckOutDataImpl value,
    $Res Function(_$GetCheckOutDataImpl) then,
  ) = __$$GetCheckOutDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String checkinTime});
}

/// @nodoc
class __$$GetCheckOutDataImplCopyWithImpl<$Res>
    extends _$UserCheckinCheckoutEventCopyWithImpl<$Res, _$GetCheckOutDataImpl>
    implements _$$GetCheckOutDataImplCopyWith<$Res> {
  __$$GetCheckOutDataImplCopyWithImpl(
    _$GetCheckOutDataImpl _value,
    $Res Function(_$GetCheckOutDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserCheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? checkinTime = null}) {
    return _then(
      _$GetCheckOutDataImpl(
        checkinTime: null == checkinTime
            ? _value.checkinTime
            : checkinTime // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GetCheckOutDataImpl implements GetCheckOutData {
  const _$GetCheckOutDataImpl({required this.checkinTime});

  @override
  final String checkinTime;

  @override
  String toString() {
    return 'UserCheckinCheckoutEvent.getCheckOutData(checkinTime: $checkinTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCheckOutDataImpl &&
            (identical(other.checkinTime, checkinTime) ||
                other.checkinTime == checkinTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checkinTime);

  /// Create a copy of UserCheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCheckOutDataImplCopyWith<_$GetCheckOutDataImpl> get copyWith =>
      __$$GetCheckOutDataImplCopyWithImpl<_$GetCheckOutDataImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )
    getCheckinData,
    required TResult Function(String checkinTime) getCheckOutData,
    required TResult Function(String checkinTime) getTechnicianCheckInDetails,
  }) {
    return getCheckOutData(checkinTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult? Function(String checkinTime)? getCheckOutData,
    TResult? Function(String checkinTime)? getTechnicianCheckInDetails,
  }) {
    return getCheckOutData?.call(checkinTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult Function(String checkinTime)? getCheckOutData,
    TResult Function(String checkinTime)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) {
    if (getCheckOutData != null) {
      return getCheckOutData(checkinTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetCheckinData value) getCheckinData,
    required TResult Function(GetCheckOutData value) getCheckOutData,
    required TResult Function(GetCheckInDetails value)
    getTechnicianCheckInDetails,
  }) {
    return getCheckOutData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetCheckinData value)? getCheckinData,
    TResult? Function(GetCheckOutData value)? getCheckOutData,
    TResult? Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
  }) {
    return getCheckOutData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetCheckinData value)? getCheckinData,
    TResult Function(GetCheckOutData value)? getCheckOutData,
    TResult Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) {
    if (getCheckOutData != null) {
      return getCheckOutData(this);
    }
    return orElse();
  }
}

abstract class GetCheckOutData implements UserCheckinCheckoutEvent {
  const factory GetCheckOutData({required final String checkinTime}) =
      _$GetCheckOutDataImpl;

  String get checkinTime;

  /// Create a copy of UserCheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCheckOutDataImplCopyWith<_$GetCheckOutDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCheckInDetailsImplCopyWith<$Res> {
  factory _$$GetCheckInDetailsImplCopyWith(
    _$GetCheckInDetailsImpl value,
    $Res Function(_$GetCheckInDetailsImpl) then,
  ) = __$$GetCheckInDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String checkinTime});
}

/// @nodoc
class __$$GetCheckInDetailsImplCopyWithImpl<$Res>
    extends
        _$UserCheckinCheckoutEventCopyWithImpl<$Res, _$GetCheckInDetailsImpl>
    implements _$$GetCheckInDetailsImplCopyWith<$Res> {
  __$$GetCheckInDetailsImplCopyWithImpl(
    _$GetCheckInDetailsImpl _value,
    $Res Function(_$GetCheckInDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserCheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? checkinTime = null}) {
    return _then(
      _$GetCheckInDetailsImpl(
        checkinTime: null == checkinTime
            ? _value.checkinTime
            : checkinTime // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GetCheckInDetailsImpl implements GetCheckInDetails {
  const _$GetCheckInDetailsImpl({required this.checkinTime});

  @override
  final String checkinTime;

  @override
  String toString() {
    return 'UserCheckinCheckoutEvent.getTechnicianCheckInDetails(checkinTime: $checkinTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCheckInDetailsImpl &&
            (identical(other.checkinTime, checkinTime) ||
                other.checkinTime == checkinTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checkinTime);

  /// Create a copy of UserCheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCheckInDetailsImplCopyWith<_$GetCheckInDetailsImpl> get copyWith =>
      __$$GetCheckInDetailsImplCopyWithImpl<_$GetCheckInDetailsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )
    getCheckinData,
    required TResult Function(String checkinTime) getCheckOutData,
    required TResult Function(String checkinTime) getTechnicianCheckInDetails,
  }) {
    return getTechnicianCheckInDetails(checkinTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult? Function(String checkinTime)? getCheckOutData,
    TResult? Function(String checkinTime)? getTechnicianCheckInDetails,
  }) {
    return getTechnicianCheckInDetails?.call(checkinTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult Function(String checkinTime)? getCheckOutData,
    TResult Function(String checkinTime)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) {
    if (getTechnicianCheckInDetails != null) {
      return getTechnicianCheckInDetails(checkinTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetCheckinData value) getCheckinData,
    required TResult Function(GetCheckOutData value) getCheckOutData,
    required TResult Function(GetCheckInDetails value)
    getTechnicianCheckInDetails,
  }) {
    return getTechnicianCheckInDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetCheckinData value)? getCheckinData,
    TResult? Function(GetCheckOutData value)? getCheckOutData,
    TResult? Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
  }) {
    return getTechnicianCheckInDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetCheckinData value)? getCheckinData,
    TResult Function(GetCheckOutData value)? getCheckOutData,
    TResult Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) {
    if (getTechnicianCheckInDetails != null) {
      return getTechnicianCheckInDetails(this);
    }
    return orElse();
  }
}

abstract class GetCheckInDetails implements UserCheckinCheckoutEvent {
  const factory GetCheckInDetails({required final String checkinTime}) =
      _$GetCheckInDetailsImpl;

  String get checkinTime;

  /// Create a copy of UserCheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCheckInDetailsImplCopyWith<_$GetCheckInDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserCheckinCheckoutState {
  CheckinModel? get checkinmodel => throw _privateConstructorUsedError;
  CheckinVieModel? get checkinViewmodel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get dataFetched => throw _privateConstructorUsedError;
  bool get dataSubmitted => throw _privateConstructorUsedError;
  bool get checkedIn => throw _privateConstructorUsedError;
  MainFailure? get failure => throw _privateConstructorUsedError;

  /// Create a copy of UserCheckinCheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCheckinCheckoutStateCopyWith<UserCheckinCheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCheckinCheckoutStateCopyWith<$Res> {
  factory $UserCheckinCheckoutStateCopyWith(
    UserCheckinCheckoutState value,
    $Res Function(UserCheckinCheckoutState) then,
  ) = _$UserCheckinCheckoutStateCopyWithImpl<$Res, UserCheckinCheckoutState>;
  @useResult
  $Res call({
    CheckinModel? checkinmodel,
    CheckinVieModel? checkinViewmodel,
    bool isLoading,
    bool isError,
    bool dataFetched,
    bool dataSubmitted,
    bool checkedIn,
    MainFailure? failure,
  });

  $MainFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$UserCheckinCheckoutStateCopyWithImpl<
  $Res,
  $Val extends UserCheckinCheckoutState
>
    implements $UserCheckinCheckoutStateCopyWith<$Res> {
  _$UserCheckinCheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCheckinCheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkinmodel = freezed,
    Object? checkinViewmodel = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? dataFetched = null,
    Object? dataSubmitted = null,
    Object? checkedIn = null,
    Object? failure = freezed,
  }) {
    return _then(
      _value.copyWith(
            checkinmodel: freezed == checkinmodel
                ? _value.checkinmodel
                : checkinmodel // ignore: cast_nullable_to_non_nullable
                      as CheckinModel?,
            checkinViewmodel: freezed == checkinViewmodel
                ? _value.checkinViewmodel
                : checkinViewmodel // ignore: cast_nullable_to_non_nullable
                      as CheckinVieModel?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isError: null == isError
                ? _value.isError
                : isError // ignore: cast_nullable_to_non_nullable
                      as bool,
            dataFetched: null == dataFetched
                ? _value.dataFetched
                : dataFetched // ignore: cast_nullable_to_non_nullable
                      as bool,
            dataSubmitted: null == dataSubmitted
                ? _value.dataSubmitted
                : dataSubmitted // ignore: cast_nullable_to_non_nullable
                      as bool,
            checkedIn: null == checkedIn
                ? _value.checkedIn
                : checkedIn // ignore: cast_nullable_to_non_nullable
                      as bool,
            failure: freezed == failure
                ? _value.failure
                : failure // ignore: cast_nullable_to_non_nullable
                      as MainFailure?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserCheckinCheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MainFailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $MainFailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserCheckinCheckoutStateImplCopyWith<$Res>
    implements $UserCheckinCheckoutStateCopyWith<$Res> {
  factory _$$UserCheckinCheckoutStateImplCopyWith(
    _$UserCheckinCheckoutStateImpl value,
    $Res Function(_$UserCheckinCheckoutStateImpl) then,
  ) = __$$UserCheckinCheckoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CheckinModel? checkinmodel,
    CheckinVieModel? checkinViewmodel,
    bool isLoading,
    bool isError,
    bool dataFetched,
    bool dataSubmitted,
    bool checkedIn,
    MainFailure? failure,
  });

  @override
  $MainFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$UserCheckinCheckoutStateImplCopyWithImpl<$Res>
    extends
        _$UserCheckinCheckoutStateCopyWithImpl<
          $Res,
          _$UserCheckinCheckoutStateImpl
        >
    implements _$$UserCheckinCheckoutStateImplCopyWith<$Res> {
  __$$UserCheckinCheckoutStateImplCopyWithImpl(
    _$UserCheckinCheckoutStateImpl _value,
    $Res Function(_$UserCheckinCheckoutStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserCheckinCheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkinmodel = freezed,
    Object? checkinViewmodel = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? dataFetched = null,
    Object? dataSubmitted = null,
    Object? checkedIn = null,
    Object? failure = freezed,
  }) {
    return _then(
      _$UserCheckinCheckoutStateImpl(
        checkinmodel: freezed == checkinmodel
            ? _value.checkinmodel
            : checkinmodel // ignore: cast_nullable_to_non_nullable
                  as CheckinModel?,
        checkinViewmodel: freezed == checkinViewmodel
            ? _value.checkinViewmodel
            : checkinViewmodel // ignore: cast_nullable_to_non_nullable
                  as CheckinVieModel?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isError: null == isError
            ? _value.isError
            : isError // ignore: cast_nullable_to_non_nullable
                  as bool,
        dataFetched: null == dataFetched
            ? _value.dataFetched
            : dataFetched // ignore: cast_nullable_to_non_nullable
                  as bool,
        dataSubmitted: null == dataSubmitted
            ? _value.dataSubmitted
            : dataSubmitted // ignore: cast_nullable_to_non_nullable
                  as bool,
        checkedIn: null == checkedIn
            ? _value.checkedIn
            : checkedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        failure: freezed == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as MainFailure?,
      ),
    );
  }
}

/// @nodoc

class _$UserCheckinCheckoutStateImpl implements _UserCheckinCheckoutState {
  const _$UserCheckinCheckoutStateImpl({
    this.checkinmodel,
    this.checkinViewmodel,
    required this.isLoading,
    required this.isError,
    required this.dataFetched,
    required this.dataSubmitted,
    required this.checkedIn,
    this.failure,
  });

  @override
  final CheckinModel? checkinmodel;
  @override
  final CheckinVieModel? checkinViewmodel;
  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final bool dataFetched;
  @override
  final bool dataSubmitted;
  @override
  final bool checkedIn;
  @override
  final MainFailure? failure;

  @override
  String toString() {
    return 'UserCheckinCheckoutState(checkinmodel: $checkinmodel, checkinViewmodel: $checkinViewmodel, isLoading: $isLoading, isError: $isError, dataFetched: $dataFetched, dataSubmitted: $dataSubmitted, checkedIn: $checkedIn, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCheckinCheckoutStateImpl &&
            (identical(other.checkinmodel, checkinmodel) ||
                other.checkinmodel == checkinmodel) &&
            (identical(other.checkinViewmodel, checkinViewmodel) ||
                other.checkinViewmodel == checkinViewmodel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.dataFetched, dataFetched) ||
                other.dataFetched == dataFetched) &&
            (identical(other.dataSubmitted, dataSubmitted) ||
                other.dataSubmitted == dataSubmitted) &&
            (identical(other.checkedIn, checkedIn) ||
                other.checkedIn == checkedIn) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    checkinmodel,
    checkinViewmodel,
    isLoading,
    isError,
    dataFetched,
    dataSubmitted,
    checkedIn,
    failure,
  );

  /// Create a copy of UserCheckinCheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCheckinCheckoutStateImplCopyWith<_$UserCheckinCheckoutStateImpl>
  get copyWith =>
      __$$UserCheckinCheckoutStateImplCopyWithImpl<
        _$UserCheckinCheckoutStateImpl
      >(this, _$identity);
}

abstract class _UserCheckinCheckoutState implements UserCheckinCheckoutState {
  const factory _UserCheckinCheckoutState({
    final CheckinModel? checkinmodel,
    final CheckinVieModel? checkinViewmodel,
    required final bool isLoading,
    required final bool isError,
    required final bool dataFetched,
    required final bool dataSubmitted,
    required final bool checkedIn,
    final MainFailure? failure,
  }) = _$UserCheckinCheckoutStateImpl;

  @override
  CheckinModel? get checkinmodel;
  @override
  CheckinVieModel? get checkinViewmodel;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get dataFetched;
  @override
  bool get dataSubmitted;
  @override
  bool get checkedIn;
  @override
  MainFailure? get failure;

  /// Create a copy of UserCheckinCheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCheckinCheckoutStateImplCopyWith<_$UserCheckinCheckoutStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
