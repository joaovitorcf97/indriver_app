// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:indriver_app/app/domain/repository/auth_respository.dart';

class GetUserSessionUsecase {
  AuthRespository authRespository;

  GetUserSessionUsecase({required this.authRespository});

  run() => authRespository.getUserSession();
}
