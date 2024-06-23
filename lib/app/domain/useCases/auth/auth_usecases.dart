// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:indriver_app/app/domain/useCases/auth/get_user_session_usecase.dart';
import 'package:indriver_app/app/domain/useCases/auth/login_usecase.dart';
import 'package:indriver_app/app/domain/useCases/auth/logout_usecase.dart';
import 'package:indriver_app/app/domain/useCases/auth/register_usecase.dart';
import 'package:indriver_app/app/domain/useCases/auth/save_user_sessio_usecase.dart';

class AuthUsecases {
  LoginUsecase login;
  RegisterUsecase regiter;
  SaveUserSessioUsecase saveUserSession;
  GetUserSessionUsecase getUserSession;
  LogoutUsecase logout;

  AuthUsecases({
    required this.login,
    required this.regiter,
    required this.saveUserSession,
    required this.getUserSession,
    required this.logout,
  });
}
