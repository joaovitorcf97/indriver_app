import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:indriver_app/app/data/api/api_config.dart';
import 'package:indriver_app/app/domain/model/auth_response.dart';
import 'package:indriver_app/app/domain/model/user.dart';
import 'package:indriver_app/app/domain/utils/list_to_string.dart';
import 'package:indriver_app/app/domain/utils/resource.dart';

class AuthService {
  Future<Resource<AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      Uri url = Uri.http(ApiConfig.apiUrl, '/auth/login');
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = json.encode({
        'email': email,
        'password': password,
      });

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);

        print('Data Remote: ${authResponse.toJson()}');
        print('Token: ${authResponse.token}');

        return Success(data: authResponse);
      } else {
        return ErrorData(message: listToString(data['message']));
      }
    } catch (e) {
      return ErrorData(message: e.toString());
    }
  }

  Future<Resource<AuthResponse>> register(User user) async {
    try {
      Uri url = Uri.http(ApiConfig.apiUrl, '/auth/register');
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = json.encode(user);

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);

        return Success(data: authResponse);
      } else {
        return ErrorData(message: listToString(data['message']));
      }
    } catch (e) {
      return ErrorData(message: e.toString());
    }
  }
}
