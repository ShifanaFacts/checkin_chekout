import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkin_checkout_event.dart';
part 'checkin_checkout_state.dart';
part 'checkin_checkout_bloc.freezed.dart';

class CheckinCheckoutBloc extends Bloc<CheckinCheckoutEvent, CheckinCheckoutState> {
  CheckinCheckoutBloc() : super(_Initial()) {
    on<CheckinCheckoutEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
