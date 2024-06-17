import 'package:indriver_app/app/domain/model/auth_response.dart';

import '../utils/resource.dart';

abstract class AuthRespository {
  Future<Resource<AuthResponse>> login({
    required String email,
    required String password,
  });
}
