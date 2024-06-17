import 'package:indriver_app/app/data/datasource/remote/services/auth_service.dart';
import 'package:indriver_app/app/domain/model/auth_response.dart';
import 'package:indriver_app/app/domain/repository/auth_respository.dart';
import 'package:indriver_app/app/domain/utils/resource.dart';

class AuthRespositoryImpl implements AuthRespository {
  AuthService authService;

  AuthRespositoryImpl({required this.authService});

  @override
  Future<Resource<AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    return await authService.login(email: email, password: password);
  }
}
