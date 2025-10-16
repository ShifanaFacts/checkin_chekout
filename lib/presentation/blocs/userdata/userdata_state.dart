part of 'userdata_bloc.dart';

@freezed
class UserdataState with _$UserdataState {
  const factory UserdataState({
    UserDataModel? userModel,
    required bool isLoading,
    required bool isError,
    required bool datafetched,
    required List<BottomNavigationBarItem> btmNavitems,
    required List<Widget> screens,
  }) = _UserdataState;

  factory UserdataState.initial() => const UserdataState(
    userModel: null,
    isLoading: false,
    isError: false,
    datafetched: false,
    btmNavitems: [],
    screens: [],
  );
}
