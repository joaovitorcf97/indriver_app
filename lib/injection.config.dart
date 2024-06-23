// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:indriver_app/app/data/datasource/local/shared_pref.dart' as _i3;
import 'package:indriver_app/app/data/datasource/remote/services/auth_service.dart'
    as _i4;
import 'package:indriver_app/app/di/app_module.dart' as _i7;
import 'package:indriver_app/app/domain/repository/auth_respository.dart'
    as _i5;
import 'package:indriver_app/app/domain/useCases/auth/auth_usecases.dart'
    as _i6;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appmodule = _$Appmodule();
    gh.factory<_i3.SharedPref>(() => appmodule.sharedPref);
    gh.factory<_i4.AuthService>(() => appmodule.authService);
    gh.factory<_i5.AuthRespository>(() => appmodule.authRespository);
    gh.factory<_i6.AuthUsecases>(() => appmodule.authUsecases);
    return this;
  }
}

class _$Appmodule extends _i7.Appmodule {}
