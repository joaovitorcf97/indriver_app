// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:indriver_app/app/domain/repository/auth_respository.dart';

class LoginUsecase {
  AuthRespository respository;

  LoginUsecase({required this.respository});

  run({required String email, required String password}) {
    return respository.login(email: email, password: password);
  }
}
