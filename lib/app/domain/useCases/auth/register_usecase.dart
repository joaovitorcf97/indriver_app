// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:indriver_app/app/domain/model/user.dart';
import 'package:indriver_app/app/domain/repository/auth_respository.dart';

class RegisterUsecase {
  AuthRespository authRespository;

  RegisterUsecase({required this.authRespository});

  run(User user) => authRespository.register(user);
}
