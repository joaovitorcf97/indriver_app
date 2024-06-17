import 'package:indriver_app/app/data/repository/auth_respository_impl.dart';
import 'package:indriver_app/app/domain/repository/auth_respository.dart';
import 'package:indriver_app/app/domain/useCases/auth/auth_usecases.dart';
import 'package:indriver_app/app/domain/useCases/auth/login_usecase.dart';
import 'package:injectable/injectable.dart';

import '../data/datasource/remote/services/auth_service.dart';

@module
abstract class Appmodule {
  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRespository get authRespository =>
      AuthRespositoryImpl(authService: authService);

  @injectable
  AuthUsecases get authUsecases => AuthUsecases(
        login: LoginUsecase(respository: authRespository),
      );
}
