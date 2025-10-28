// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'in_out_report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$InOutReportEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String ReportType, String fmdate, String todate)
    getReportList,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String ReportType, String fmdate, String todate)?
    getReportList,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String ReportType, String fmdate, String todate)?
    getReportList,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetInoutReport value) getReportList,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetInoutReport value)? getReportList,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetInoutReport value)? getReportList,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InOutReportEventCopyWith<$Res> {
  factory $InOutReportEventCopyWith(
    InOutReportEvent value,
    $Res Function(InOutReportEvent) then,
  ) = _$InOutReportEventCopyWithImpl<$Res, InOutReportEvent>;
}

/// @nodoc
class _$InOutReportEventCopyWithImpl<$Res, $Val extends InOutReportEvent>
    implements $InOutReportEventCopyWith<$Res> {
  _$InOutReportEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InOutReportEvent
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
    extends _$InOutReportEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InOutReportEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'InOutReportEvent.started()';
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
    required TResult Function(String ReportType, String fmdate, String todate)
    getReportList,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String ReportType, String fmdate, String todate)?
    getReportList,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String ReportType, String fmdate, String todate)?
    getReportList,
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
    required TResult Function(GetInoutReport value) getReportList,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetInoutReport value)? getReportList,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetInoutReport value)? getReportList,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements InOutReportEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetInoutReportImplCopyWith<$Res> {
  factory _$$GetInoutReportImplCopyWith(
    _$GetInoutReportImpl value,
    $Res Function(_$GetInoutReportImpl) then,
  ) = __$$GetInoutReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ReportType, String fmdate, String todate});
}

/// @nodoc
class __$$GetInoutReportImplCopyWithImpl<$Res>
    extends _$InOutReportEventCopyWithImpl<$Res, _$GetInoutReportImpl>
    implements _$$GetInoutReportImplCopyWith<$Res> {
  __$$GetInoutReportImplCopyWithImpl(
    _$GetInoutReportImpl _value,
    $Res Function(_$GetInoutReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InOutReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ReportType = null,
    Object? fmdate = null,
    Object? todate = null,
  }) {
    return _then(
      _$GetInoutReportImpl(
        ReportType: null == ReportType
            ? _value.ReportType
            : ReportType // ignore: cast_nullable_to_non_nullable
                  as String,
        fmdate: null == fmdate
            ? _value.fmdate
            : fmdate // ignore: cast_nullable_to_non_nullable
                  as String,
        todate: null == todate
            ? _value.todate
            : todate // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GetInoutReportImpl implements GetInoutReport {
  const _$GetInoutReportImpl({
    required this.ReportType,
    required this.fmdate,
    required this.todate,
  });

  @override
  final String ReportType;
  @override
  final String fmdate;
  @override
  final String todate;

  @override
  String toString() {
    return 'InOutReportEvent.getReportList(ReportType: $ReportType, fmdate: $fmdate, todate: $todate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetInoutReportImpl &&
            (identical(other.ReportType, ReportType) ||
                other.ReportType == ReportType) &&
            (identical(other.fmdate, fmdate) || other.fmdate == fmdate) &&
            (identical(other.todate, todate) || other.todate == todate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ReportType, fmdate, todate);

  /// Create a copy of InOutReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetInoutReportImplCopyWith<_$GetInoutReportImpl> get copyWith =>
      __$$GetInoutReportImplCopyWithImpl<_$GetInoutReportImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String ReportType, String fmdate, String todate)
    getReportList,
  }) {
    return getReportList(ReportType, fmdate, todate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String ReportType, String fmdate, String todate)?
    getReportList,
  }) {
    return getReportList?.call(ReportType, fmdate, todate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String ReportType, String fmdate, String todate)?
    getReportList,
    required TResult orElse(),
  }) {
    if (getReportList != null) {
      return getReportList(ReportType, fmdate, todate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetInoutReport value) getReportList,
  }) {
    return getReportList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetInoutReport value)? getReportList,
  }) {
    return getReportList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetInoutReport value)? getReportList,
    required TResult orElse(),
  }) {
    if (getReportList != null) {
      return getReportList(this);
    }
    return orElse();
  }
}

abstract class GetInoutReport implements InOutReportEvent {
  const factory GetInoutReport({
    required final String ReportType,
    required final String fmdate,
    required final String todate,
  }) = _$GetInoutReportImpl;

  String get ReportType;
  String get fmdate;
  String get todate;

  /// Create a copy of InOutReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetInoutReportImplCopyWith<_$GetInoutReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InOutReportState {
  ReportTimeDataModelList? get inOutTimeReport =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get dataFetched => throw _privateConstructorUsedError;
  MainFailure? get failure => throw _privateConstructorUsedError;

  /// Create a copy of InOutReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InOutReportStateCopyWith<InOutReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InOutReportStateCopyWith<$Res> {
  factory $InOutReportStateCopyWith(
    InOutReportState value,
    $Res Function(InOutReportState) then,
  ) = _$InOutReportStateCopyWithImpl<$Res, InOutReportState>;
  @useResult
  $Res call({
    ReportTimeDataModelList? inOutTimeReport,
    bool isLoading,
    bool isError,
    bool dataFetched,
    MainFailure? failure,
  });

  $MainFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$InOutReportStateCopyWithImpl<$Res, $Val extends InOutReportState>
    implements $InOutReportStateCopyWith<$Res> {
  _$InOutReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InOutReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inOutTimeReport = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? dataFetched = null,
    Object? failure = freezed,
  }) {
    return _then(
      _value.copyWith(
            inOutTimeReport: freezed == inOutTimeReport
                ? _value.inOutTimeReport
                : inOutTimeReport // ignore: cast_nullable_to_non_nullable
                      as ReportTimeDataModelList?,
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
            failure: freezed == failure
                ? _value.failure
                : failure // ignore: cast_nullable_to_non_nullable
                      as MainFailure?,
          )
          as $Val,
    );
  }

  /// Create a copy of InOutReportState
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
abstract class _$$InOutReportStateImplCopyWith<$Res>
    implements $InOutReportStateCopyWith<$Res> {
  factory _$$InOutReportStateImplCopyWith(
    _$InOutReportStateImpl value,
    $Res Function(_$InOutReportStateImpl) then,
  ) = __$$InOutReportStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ReportTimeDataModelList? inOutTimeReport,
    bool isLoading,
    bool isError,
    bool dataFetched,
    MainFailure? failure,
  });

  @override
  $MainFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$InOutReportStateImplCopyWithImpl<$Res>
    extends _$InOutReportStateCopyWithImpl<$Res, _$InOutReportStateImpl>
    implements _$$InOutReportStateImplCopyWith<$Res> {
  __$$InOutReportStateImplCopyWithImpl(
    _$InOutReportStateImpl _value,
    $Res Function(_$InOutReportStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InOutReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inOutTimeReport = freezed,
    Object? isLoading = null,
    Object? isError = null,
    Object? dataFetched = null,
    Object? failure = freezed,
  }) {
    return _then(
      _$InOutReportStateImpl(
        inOutTimeReport: freezed == inOutTimeReport
            ? _value.inOutTimeReport
            : inOutTimeReport // ignore: cast_nullable_to_non_nullable
                  as ReportTimeDataModelList?,
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
        failure: freezed == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as MainFailure?,
      ),
    );
  }
}

/// @nodoc

class _$InOutReportStateImpl implements _InOutReportState {
  const _$InOutReportStateImpl({
    this.inOutTimeReport,
    required this.isLoading,
    required this.isError,
    required this.dataFetched,
    this.failure,
  });

  @override
  final ReportTimeDataModelList? inOutTimeReport;
  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final bool dataFetched;
  @override
  final MainFailure? failure;

  @override
  String toString() {
    return 'InOutReportState(inOutTimeReport: $inOutTimeReport, isLoading: $isLoading, isError: $isError, dataFetched: $dataFetched, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InOutReportStateImpl &&
            (identical(other.inOutTimeReport, inOutTimeReport) ||
                other.inOutTimeReport == inOutTimeReport) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.dataFetched, dataFetched) ||
                other.dataFetched == dataFetched) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    inOutTimeReport,
    isLoading,
    isError,
    dataFetched,
    failure,
  );

  /// Create a copy of InOutReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InOutReportStateImplCopyWith<_$InOutReportStateImpl> get copyWith =>
      __$$InOutReportStateImplCopyWithImpl<_$InOutReportStateImpl>(
        this,
        _$identity,
      );
}

abstract class _InOutReportState implements InOutReportState {
  const factory _InOutReportState({
    final ReportTimeDataModelList? inOutTimeReport,
    required final bool isLoading,
    required final bool isError,
    required final bool dataFetched,
    final MainFailure? failure,
  }) = _$InOutReportStateImpl;

  @override
  ReportTimeDataModelList? get inOutTimeReport;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get dataFetched;
  @override
  MainFailure? get failure;

  /// Create a copy of InOutReportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InOutReportStateImplCopyWith<_$InOutReportStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
