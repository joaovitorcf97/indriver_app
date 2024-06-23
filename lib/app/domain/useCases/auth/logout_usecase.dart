// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:indriver_app/app/domain/repository/auth_respository.dart';

class LogoutUsecase {
  AuthRespository authRespository;

  LogoutUsecase({required this.authRespository});

  run() => authRespository.logout();
}
