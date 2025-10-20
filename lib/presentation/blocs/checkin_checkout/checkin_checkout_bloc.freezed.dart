// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin_checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CheckinCheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
      double lat,
      double long,
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )
    getCheckinData,
    required TResult Function() getCheckOutData,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
      double lat,
      double long,
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult? Function()? getCheckOutData,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
      double lat,
      double long,
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult Function()? getCheckOutData,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(GetCheckinData value) getCheckinData,
    required TResult Function(GetCheckOutData value) getCheckOutData,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(GetCheckinData value)? getCheckinData,
    TResult? Function(GetCheckOutData value)? getCheckOutData,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(GetCheckinData value)? getCheckinData,
    TResult Function(GetCheckOutData value)? getCheckOutData,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckinCheckoutEventCopyWith<$Res> {
  factory $CheckinCheckoutEventCopyWith(
    CheckinCheckoutEvent value,
    $Res Function(CheckinCheckoutEvent) then,
  ) = _$CheckinCheckoutEventCopyWithImpl<$Res, CheckinCheckoutEvent>;
}

/// @nodoc
class _$CheckinCheckoutEventCopyWithImpl<
  $Res,
  $Val extends CheckinCheckoutEvent
>
    implements $CheckinCheckoutEventCopyWith<$Res> {
  _$CheckinCheckoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckinCheckoutEvent
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
    extends _$CheckinCheckoutEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
    _$InitializeImpl _value,
    $Res Function(_$InitializeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'CheckinCheckoutEvent.initialize()';
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
    required TResult Function(
      double lat,
      double long,
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )
    getCheckinData,
    required TResult Function() getCheckOutData,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
      double lat,
      double long,
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult? Function()? getCheckOutData,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
      double lat,
      double long,
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult Function()? getCheckOutData,
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
    required TResult Function(GetCheckinData value) getCheckinData,
    required TResult Function(GetCheckOutData value) getCheckOutData,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(GetCheckinData value)? getCheckinData,
    TResult? Function(GetCheckOutData value)? getCheckOutData,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(GetCheckinData value)? getCheckinData,
    TResult Function(GetCheckOutData value)? getCheckOutData,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements CheckinCheckoutEvent {
  const factory Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$GetCheckinDataImplCopyWith<$Res> {
  factory _$$GetCheckinDataImplCopyWith(
    _$GetCheckinDataImpl value,
    $Res Function(_$GetCheckinDataImpl) then,
  ) = __$$GetCheckinDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    double lat,
    double long,
    Map<String, String> dropDownSelectionObject,
    String checkinTime,
  });
}

/// @nodoc
class __$$GetCheckinDataImplCopyWithImpl<$Res>
    extends _$CheckinCheckoutEventCopyWithImpl<$Res, _$GetCheckinDataImpl>
    implements _$$GetCheckinDataImplCopyWith<$Res> {
  __$$GetCheckinDataImplCopyWithImpl(
    _$GetCheckinDataImpl _value,
    $Res Function(_$GetCheckinDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? long = null,
    Object? dropDownSelectionObject = null,
    Object? checkinTime = null,
  }) {
    return _then(
      _$GetCheckinDataImpl(
        lat: null == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double,
        long: null == long
            ? _value.long
            : long // ignore: cast_nullable_to_non_nullable
                  as double,
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
    required this.lat,
    required this.long,
    required final Map<String, String> dropDownSelectionObject,
    required this.checkinTime,
  }) : _dropDownSelectionObject = dropDownSelectionObject;

  @override
  final double lat;
  @override
  final double long;
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
    return 'CheckinCheckoutEvent.getCheckinData(lat: $lat, long: $long, dropDownSelectionObject: $dropDownSelectionObject, checkinTime: $checkinTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCheckinDataImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
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
    lat,
    long,
    const DeepCollectionEquality().hash(_dropDownSelectionObject),
    checkinTime,
  );

  /// Create a copy of CheckinCheckoutEvent
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
    required TResult Function() initialize,
    required TResult Function(
      double lat,
      double long,
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )
    getCheckinData,
    required TResult Function() getCheckOutData,
  }) {
    return getCheckinData(lat, long, dropDownSelectionObject, checkinTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
      double lat,
      double long,
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult? Function()? getCheckOutData,
  }) {
    return getCheckinData?.call(
      lat,
      long,
      dropDownSelectionObject,
      checkinTime,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
      double lat,
      double long,
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult Function()? getCheckOutData,
    required TResult orElse(),
  }) {
    if (getCheckinData != null) {
      return getCheckinData(lat, long, dropDownSelectionObject, checkinTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(GetCheckinData value) getCheckinData,
    required TResult Function(GetCheckOutData value) getCheckOutData,
  }) {
    return getCheckinData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(GetCheckinData value)? getCheckinData,
    TResult? Function(GetCheckOutData value)? getCheckOutData,
  }) {
    return getCheckinData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(GetCheckinData value)? getCheckinData,
    TResult Function(GetCheckOutData value)? getCheckOutData,
    required TResult orElse(),
  }) {
    if (getCheckinData != null) {
      return getCheckinData(this);
    }
    return orElse();
  }
}

abstract class GetCheckinData implements CheckinCheckoutEvent {
  const factory GetCheckinData({
    required final double lat,
    required final double long,
    required final Map<String, String> dropDownSelectionObject,
    required final String checkinTime,
  }) = _$GetCheckinDataImpl;

  double get lat;
  double get long;
  Map<String, String> get dropDownSelectionObject;
  String get checkinTime;

  /// Create a copy of CheckinCheckoutEvent
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
}

/// @nodoc
class __$$GetCheckOutDataImplCopyWithImpl<$Res>
    extends _$CheckinCheckoutEventCopyWithImpl<$Res, _$GetCheckOutDataImpl>
    implements _$$GetCheckOutDataImplCopyWith<$Res> {
  __$$GetCheckOutDataImplCopyWithImpl(
    _$GetCheckOutDataImpl _value,
    $Res Function(_$GetCheckOutDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckinCheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetCheckOutDataImpl implements GetCheckOutData {
  const _$GetCheckOutDataImpl();

  @override
  String toString() {
    return 'CheckinCheckoutEvent.getCheckOutData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCheckOutDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
      double lat,
      double long,
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )
    getCheckinData,
    required TResult Function() getCheckOutData,
  }) {
    return getCheckOutData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
      double lat,
      double long,
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult? Function()? getCheckOutData,
  }) {
    return getCheckOutData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
      double lat,
      double long,
      Map<String, String> dropDownSelectionObject,
      String checkinTime,
    )?
    getCheckinData,
    TResult Function()? getCheckOutData,
    required TResult orElse(),
  }) {
    if (getCheckOutData != null) {
      return getCheckOutData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(GetCheckinData value) getCheckinData,
    required TResult Function(GetCheckOutData value) getCheckOutData,
  }) {
    return getCheckOutData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(GetCheckinData value)? getCheckinData,
    TResult? Function(GetCheckOutData value)? getCheckOutData,
  }) {
    return getCheckOutData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(GetCheckinData value)? getCheckinData,
    TResult Function(GetCheckOutData value)? getCheckOutData,
    required TResult orElse(),
  }) {
    if (getCheckOutData != null) {
      return getCheckOutData(this);
    }
    return orElse();
  }
}

abstract class GetCheckOutData implements CheckinCheckoutEvent {
  const factory GetCheckOutData() = _$GetCheckOutDataImpl;
}

/// @nodoc
mixin _$CheckinCheckoutState {
  CheckinVieModel? get checkinmodel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get dataFetched => throw _privateConstructorUsedError;
  bool get dataSubmitted => throw _privateConstructorUsedError;
  MainFailure? get failure => throw _privateConstructorUsedError;

  /// Create a copy of CheckinCheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckinCheckoutStateCopyWith<CheckinCheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckinCheckoutStateCopyWith<$Res> {
  factory $CheckinCheckoutStateCopyWith(
    CheckinCheckoutState value,
    $Res Function(CheckinCheckoutState) then,
  ) = _$CheckinCheckoutStateCopyWithImpl<$Res, CheckinCheckoutState>;
  @useResult
  $Res call({
    CheckinVieModel? checkinmodel,
    bool isLoading,
    bool isError,
    bool dataFetched,
    bool dataSubmitted,
    MainFailure? failure,
  });

  $MainFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$CheckinCheckoutStateCopyWithImpl<
  $Res,
  $Val extends CheckinCheckoutState
>
    implements $CheckinCheckoutStateCopyWith<$Res> {
  _$CheckinCheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckinCheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkinmodel = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? dataFetched = null,
    Object? dataSubmitted = null,
    Object? failure = freezed,
  }) {
    return _then(
      _value.copyWith(
            checkinmodel: freezed == checkinmodel
                ? _value.checkinmodel
                : checkinmodel // ignore: cast_nullable_to_non_nullable
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
            failure: freezed == failure
                ? _value.failure
                : failure // ignore: cast_nullable_to_non_nullable
                      as MainFailure?,
          )
          as $Val,
    );
  }

  /// Create a copy of CheckinCheckoutState
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
abstract class _$$CheckinCheckoutStateImplCopyWith<$Res>
    implements $CheckinCheckoutStateCopyWith<$Res> {
  factory _$$CheckinCheckoutStateImplCopyWith(
    _$CheckinCheckoutStateImpl value,
    $Res Function(_$CheckinCheckoutStateImpl) then,
  ) = __$$CheckinCheckoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CheckinVieModel? checkinmodel,
    bool isLoading,
    bool isError,
    bool dataFetched,
    bool dataSubmitted,
    MainFailure? failure,
  });

  @override
  $MainFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$CheckinCheckoutStateImplCopyWithImpl<$Res>
    extends _$CheckinCheckoutStateCopyWithImpl<$Res, _$CheckinCheckoutStateImpl>
    implements _$$CheckinCheckoutStateImplCopyWith<$Res> {
  __$$CheckinCheckoutStateImplCopyWithImpl(
    _$CheckinCheckoutStateImpl _value,
    $Res Function(_$CheckinCheckoutStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckinCheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkinmodel = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? dataFetched = null,
    Object? dataSubmitted = null,
    Object? failure = freezed,
  }) {
    return _then(
      _$CheckinCheckoutStateImpl(
        checkinmodel: freezed == checkinmodel
            ? _value.checkinmodel
            : checkinmodel // ignore: cast_nullable_to_non_nullable
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
        failure: freezed == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as MainFailure?,
      ),
    );
  }
}

/// @nodoc

class _$CheckinCheckoutStateImpl implements _CheckinCheckoutState {
  const _$CheckinCheckoutStateImpl({
    this.checkinmodel,
    required this.isLoading,
    required this.isError,
    required this.dataFetched,
    required this.dataSubmitted,
    this.failure,
  });

  @override
  final CheckinVieModel? checkinmodel;
  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final bool dataFetched;
  @override
  final bool dataSubmitted;
  @override
  final MainFailure? failure;

  @override
  String toString() {
    return 'CheckinCheckoutState(checkinmodel: $checkinmodel, isLoading: $isLoading, isError: $isError, dataFetched: $dataFetched, dataSubmitted: $dataSubmitted, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckinCheckoutStateImpl &&
            (identical(other.checkinmodel, checkinmodel) ||
                other.checkinmodel == checkinmodel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.dataFetched, dataFetched) ||
                other.dataFetched == dataFetched) &&
            (identical(other.dataSubmitted, dataSubmitted) ||
                other.dataSubmitted == dataSubmitted) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    checkinmodel,
    isLoading,
    isError,
    dataFetched,
    dataSubmitted,
    failure,
  );

  /// Create a copy of CheckinCheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckinCheckoutStateImplCopyWith<_$CheckinCheckoutStateImpl>
  get copyWith =>
      __$$CheckinCheckoutStateImplCopyWithImpl<_$CheckinCheckoutStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CheckinCheckoutState implements CheckinCheckoutState {
  const factory _CheckinCheckoutState({
    final CheckinVieModel? checkinmodel,
    required final bool isLoading,
    required final bool isError,
    required final bool dataFetched,
    required final bool dataSubmitted,
    final MainFailure? failure,
  }) = _$CheckinCheckoutStateImpl;

  @override
  CheckinVieModel? get checkinmodel;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get dataFetched;
  @override
  bool get dataSubmitted;
  @override
  MainFailure? get failure;

  /// Create a copy of CheckinCheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckinCheckoutStateImplCopyWith<_$CheckinCheckoutStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
