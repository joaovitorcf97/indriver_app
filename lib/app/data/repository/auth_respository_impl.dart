import 'package:indriver_app/app/data/datasource/local/shared_pref.dart';
import 'package:indriver_app/app/data/datasource/remote/services/auth_service.dart';
import 'package:indriver_app/app/domain/model/auth_response.dart';
import 'package:indriver_app/app/domain/model/user.dart';
import 'package:indriver_app/app/domain/repository/auth_respository.dart';
import 'package:indriver_app/app/domain/utils/resource.dart';

class AuthRespositoryImpl implements AuthRespository {
  AuthService authService;
  SharedPref sharedPref;

  AuthRespositoryImpl({required this.authService, required this.sharedPref});

  @override
  Future<Resource<AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    return await authService.login(email: email, password: password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authService.register(user);
  }

  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharedPref.read('user');

    if (data != null) {
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }

    return null;
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    await sharedPref.save('user', authResponse.toJson());
  }

  @override
  Future<bool> logout() async {
    return await sharedPref.remove('user');
  }
}
