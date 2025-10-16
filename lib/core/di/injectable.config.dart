// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:checkin_checkout/core/repository/loginRepo.dart' as _i694;
import 'package:checkin_checkout/core/repository/userrepo.dart' as _i103;
import 'package:checkin_checkout/core/services/login_service.dart' as _i726;
import 'package:checkin_checkout/core/services/user_service.dart' as _i869;
import 'package:checkin_checkout/presentation/blocs/login/login_bloc.dart'
    as _i311;
import 'package:checkin_checkout/presentation/blocs/userdata/userdata_bloc.dart'
    as _i927;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i694.LoginRepo>(() => _i726.LoginService());
    gh.lazySingleton<_i103.UserDetailRepo>(() => _i869.UserDetailService());
    gh.factory<_i311.LoginBloc>(() => _i311.LoginBloc(gh<_i694.LoginRepo>()));
    gh.factory<_i927.UserdataBloc>(
      () => _i927.UserdataBloc(gh<_i103.UserDetailRepo>()),
    );
    return this;
  }
}
