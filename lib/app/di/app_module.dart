import 'package:indriver_app/app/data/repository/auth_respository_impl.dart';
import 'package:indriver_app/app/domain/repository/auth_respository.dart';
import 'package:indriver_app/app/domain/useCases/auth/auth_usecases.dart';
import 'package:indriver_app/app/domain/useCases/auth/get_user_session_usecase.dart';
import 'package:indriver_app/app/domain/useCases/auth/login_usecase.dart';
import 'package:indriver_app/app/domain/useCases/auth/logout_usecase.dart';
import 'package:indriver_app/app/domain/useCases/auth/register_usecase.dart';
import 'package:indriver_app/app/domain/useCases/auth/save_user_sessio_usecase.dart';
import 'package:injectable/injectable.dart';

import '../data/datasource/local/shared_pref.dart';
import '../data/datasource/remote/services/auth_service.dart';

@module
abstract class Appmodule {
  @Injectable()
  SharedPref get sharedPref => SharedPref();

  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRespository get authRespository =>
      AuthRespositoryImpl(authService: authService, sharedPref: sharedPref);

  @injectable
  AuthUsecases get authUsecases => AuthUsecases(
        login: LoginUsecase(respository: authRespository),
        regiter: RegisterUsecase(authRespository: authRespository),
        saveUserSession:
            SaveUserSessioUsecase(authRespository: authRespository),
        getUserSession: GetUserSessionUsecase(authRespository: authRespository),
        logout: LogoutUsecase(authRespository: authRespository),
      );
}
