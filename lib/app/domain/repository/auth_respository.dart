import 'package:indriver_app/app/domain/model/auth_response.dart';
import 'package:indriver_app/app/domain/model/user.dart';

import '../utils/resource.dart';

abstract class AuthRespository {
  Future<Resource<AuthResponse>> login({
    required String email,
    required String password,
  });
  Future<Resource<AuthResponse>> register(User user);
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<AuthResponse?> getUserSession();
  Future<bool> logout();
}
