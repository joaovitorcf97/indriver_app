// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:indriver_app/app/domain/model/auth_response.dart';
import 'package:indriver_app/app/domain/repository/auth_respository.dart';

class SaveUserSessioUsecase {
  AuthRespository authRespository;

  SaveUserSessioUsecase({required this.authRespository});

  run(AuthResponse authResponse) =>
      authRespository.saveUserSession(authResponse);
}
