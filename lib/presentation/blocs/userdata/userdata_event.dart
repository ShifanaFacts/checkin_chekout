part of 'userdata_bloc.dart';

@freezed
class UserdataEvent with _$UserdataEvent {
  const factory UserdataEvent.initialize() = Initialize;
  const factory UserdataEvent.getUserData() = GetUserData;
}
