// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CheckinDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double lat, double long, String checkinTime)
    getTechnicianCheckInDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double lat, double long, String checkinTime)?
    getTechnicianCheckInDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double lat, double long, String checkinTime)?
    getTechnicianCheckInDetails,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetCheckInDetails value)
    getTechnicianCheckInDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckinDetailsEventCopyWith<$Res> {
  factory $CheckinDetailsEventCopyWith(
    CheckinDetailsEvent value,
    $Res Function(CheckinDetailsEvent) then,
  ) = _$CheckinDetailsEventCopyWithImpl<$Res, CheckinDetailsEvent>;
}

/// @nodoc
class _$CheckinDetailsEventCopyWithImpl<$Res, $Val extends CheckinDetailsEvent>
    implements $CheckinDetailsEventCopyWith<$Res> {
  _$CheckinDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckinDetailsEvent
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
    extends _$CheckinDetailsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckinDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CheckinDetailsEvent.started()';
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
    required TResult Function(double lat, double long, String checkinTime)
    getTechnicianCheckInDetails,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double lat, double long, String checkinTime)?
    getTechnicianCheckInDetails,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double lat, double long, String checkinTime)?
    getTechnicianCheckInDetails,
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
    required TResult Function(GetCheckInDetails value)
    getTechnicianCheckInDetails,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CheckinDetailsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetCheckInDetailsImplCopyWith<$Res> {
  factory _$$GetCheckInDetailsImplCopyWith(
    _$GetCheckInDetailsImpl value,
    $Res Function(_$GetCheckInDetailsImpl) then,
  ) = __$$GetCheckInDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double lat, double long, String checkinTime});
}

/// @nodoc
class __$$GetCheckInDetailsImplCopyWithImpl<$Res>
    extends _$CheckinDetailsEventCopyWithImpl<$Res, _$GetCheckInDetailsImpl>
    implements _$$GetCheckInDetailsImplCopyWith<$Res> {
  __$$GetCheckInDetailsImplCopyWithImpl(
    _$GetCheckInDetailsImpl _value,
    $Res Function(_$GetCheckInDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckinDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? long = null,
    Object? checkinTime = null,
  }) {
    return _then(
      _$GetCheckInDetailsImpl(
        lat: null == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double,
        long: null == long
            ? _value.long
            : long // ignore: cast_nullable_to_non_nullable
                  as double,
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
  const _$GetCheckInDetailsImpl({
    required this.lat,
    required this.long,
    required this.checkinTime,
  });

  @override
  final double lat;
  @override
  final double long;
  @override
  final String checkinTime;

  @override
  String toString() {
    return 'CheckinDetailsEvent.getTechnicianCheckInDetails(lat: $lat, long: $long, checkinTime: $checkinTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCheckInDetailsImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.checkinTime, checkinTime) ||
                other.checkinTime == checkinTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, long, checkinTime);

  /// Create a copy of CheckinDetailsEvent
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
    required TResult Function(double lat, double long, String checkinTime)
    getTechnicianCheckInDetails,
  }) {
    return getTechnicianCheckInDetails(lat, long, checkinTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double lat, double long, String checkinTime)?
    getTechnicianCheckInDetails,
  }) {
    return getTechnicianCheckInDetails?.call(lat, long, checkinTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double lat, double long, String checkinTime)?
    getTechnicianCheckInDetails,
    required TResult orElse(),
  }) {
    if (getTechnicianCheckInDetails != null) {
      return getTechnicianCheckInDetails(lat, long, checkinTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetCheckInDetails value)
    getTechnicianCheckInDetails,
  }) {
    return getTechnicianCheckInDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
  }) {
    return getTechnicianCheckInDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetCheckInDetails value)? getTechnicianCheckInDetails,
    required TResult orElse(),
  }) {
    if (getTechnicianCheckInDetails != null) {
      return getTechnicianCheckInDetails(this);
    }
    return orElse();
  }
}

abstract class GetCheckInDetails implements CheckinDetailsEvent {
  const factory GetCheckInDetails({
    required final double lat,
    required final double long,
    required final String checkinTime,
  }) = _$GetCheckInDetailsImpl;

  double get lat;
  double get long;
  String get checkinTime;

  /// Create a copy of CheckinDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCheckInDetailsImplCopyWith<_$GetCheckInDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CheckinDetailsState {
  CheckinVieModel? get checkinViewmodel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get dataFetched => throw _privateConstructorUsedError;
  bool get dataSubmitted => throw _privateConstructorUsedError;
  bool get checkedIn => throw _privateConstructorUsedError;
  MainFailure? get failure => throw _privateConstructorUsedError;

  /// Create a copy of CheckinDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckinDetailsStateCopyWith<CheckinDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckinDetailsStateCopyWith<$Res> {
  factory $CheckinDetailsStateCopyWith(
    CheckinDetailsState value,
    $Res Function(CheckinDetailsState) then,
  ) = _$CheckinDetailsStateCopyWithImpl<$Res, CheckinDetailsState>;
  @useResult
  $Res call({
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
class _$CheckinDetailsStateCopyWithImpl<$Res, $Val extends CheckinDetailsState>
    implements $CheckinDetailsStateCopyWith<$Res> {
  _$CheckinDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckinDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
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

  /// Create a copy of CheckinDetailsState
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
abstract class _$$CheckinDetailsStateImplCopyWith<$Res>
    implements $CheckinDetailsStateCopyWith<$Res> {
  factory _$$CheckinDetailsStateImplCopyWith(
    _$CheckinDetailsStateImpl value,
    $Res Function(_$CheckinDetailsStateImpl) then,
  ) = __$$CheckinDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
class __$$CheckinDetailsStateImplCopyWithImpl<$Res>
    extends _$CheckinDetailsStateCopyWithImpl<$Res, _$CheckinDetailsStateImpl>
    implements _$$CheckinDetailsStateImplCopyWith<$Res> {
  __$$CheckinDetailsStateImplCopyWithImpl(
    _$CheckinDetailsStateImpl _value,
    $Res Function(_$CheckinDetailsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckinDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkinViewmodel = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? dataFetched = null,
    Object? dataSubmitted = null,
    Object? checkedIn = null,
    Object? failure = freezed,
  }) {
    return _then(
      _$CheckinDetailsStateImpl(
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

class _$CheckinDetailsStateImpl implements _CheckinDetailsState {
  const _$CheckinDetailsStateImpl({
    this.checkinViewmodel,
    required this.isLoading,
    required this.isError,
    required this.dataFetched,
    required this.dataSubmitted,
    required this.checkedIn,
    this.failure,
  });

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
    return 'CheckinDetailsState(checkinViewmodel: $checkinViewmodel, isLoading: $isLoading, isError: $isError, dataFetched: $dataFetched, dataSubmitted: $dataSubmitted, checkedIn: $checkedIn, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckinDetailsStateImpl &&
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
    checkinViewmodel,
    isLoading,
    isError,
    dataFetched,
    dataSubmitted,
    checkedIn,
    failure,
  );

  /// Create a copy of CheckinDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckinDetailsStateImplCopyWith<_$CheckinDetailsStateImpl> get copyWith =>
      __$$CheckinDetailsStateImplCopyWithImpl<_$CheckinDetailsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CheckinDetailsState implements CheckinDetailsState {
  const factory _CheckinDetailsState({
    final CheckinVieModel? checkinViewmodel,
    required final bool isLoading,
    required final bool isError,
    required final bool dataFetched,
    required final bool dataSubmitted,
    required final bool checkedIn,
    final MainFailure? failure,
  }) = _$CheckinDetailsStateImpl;

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

  /// Create a copy of CheckinDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckinDetailsStateImplCopyWith<_$CheckinDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
