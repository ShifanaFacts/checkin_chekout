part of 'userdata_bloc.dart';

@freezed
class UserdataEvent with _$UserdataEvent {
  const factory UserdataEvent.initialize() = Initialize;
  const factory UserdataEvent.getUserData({required String logingId}) =
      GetUserData;

  // const factory UserdataEvent.getFcmToken({required String logingId}) =
  //     GetFcmToken;

  const factory UserdataEvent.postUserFCMToken({
    required String logingId,
    required String token,
  }) = PostUserFCMToken;
}
