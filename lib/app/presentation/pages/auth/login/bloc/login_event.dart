import 'package:indriver_app/app/domain/model/auth_response.dart';

import '../../../../utils/bloc_form_item.dart';

abstract class LoginEvent {}

class LoginInitEvent extends LoginEvent {}

class EmailChanged extends LoginEvent {
  final BlocFormItem email;

  EmailChanged({required this.email});
}

class PasswordChanged extends LoginEvent {
  final BlocFormItem password;

  PasswordChanged({required this.password});
}

class SaveUserSession extends LoginEvent {
  final AuthResponse authResponse;

  SaveUserSession({required this.authResponse});
}

class FormSubmit extends LoginEvent {}
