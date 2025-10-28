// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:checkin_checkout/core/repository/checkin_checkout_repo.dart'
    as _i446;
import 'package:checkin_checkout/core/repository/loggedUserHandleRepo.dart'
    as _i921;
import 'package:checkin_checkout/core/repository/loginRepo.dart' as _i694;
import 'package:checkin_checkout/core/repository/reportrepo.dart' as _i633;
import 'package:checkin_checkout/core/services/checkin_checkout_service.dart'
    as _i1070;
import 'package:checkin_checkout/core/services/logged_user_service.dart'
    as _i630;
import 'package:checkin_checkout/core/services/login_service.dart' as _i726;
import 'package:checkin_checkout/core/services/report_service.dart' as _i801;
import 'package:checkin_checkout/presentation/blocs/InOutReport/in_out_report_bloc.dart'
    as _i526;
import 'package:checkin_checkout/presentation/blocs/loggedUserHandles/logged_user_handle_bloc.dart'
    as _i994;
import 'package:checkin_checkout/presentation/blocs/login/login_bloc.dart'
    as _i311;
import 'package:checkin_checkout/presentation/blocs/userCheckinCheckout/user_checkin_checkout_bloc.dart'
    as _i50;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i633.ReportRepo>(() => _i801.ReportService());
    gh.lazySingleton<_i921.Loggeduserhandlerepo>(
      () => _i630.LoggedUserService(),
    );
    gh.lazySingleton<_i694.LoginRepo>(() => _i726.LoginService());
    gh.factory<_i994.LoggedUserHandleBloc>(
      () => _i994.LoggedUserHandleBloc(gh<_i921.Loggeduserhandlerepo>()),
    );
    gh.lazySingleton<_i446.CheckinCheckoutRepo>(
      () => _i1070.CheckinCheckoutService(),
    );
    gh.factory<_i526.InOutReportBloc>(
      () => _i526.InOutReportBloc(gh<_i633.ReportRepo>()),
    );
    gh.factory<_i50.UserCheckinCheckoutBloc>(
      () => _i50.UserCheckinCheckoutBloc(gh<_i446.CheckinCheckoutRepo>()),
    );
    gh.factory<_i311.LoginBloc>(() => _i311.LoginBloc(gh<_i694.LoginRepo>()));
    return this;
  }
}
