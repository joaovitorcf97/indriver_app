import 'package:indriver_app/app/presentation/utils/bloc_form_item.dart';

abstract class RegisterEvent {}

class RegisterInitEvent extends RegisterEvent {}

class NameChanged extends RegisterEvent {
  final BlocFormItem name;

  NameChanged({required this.name});
}

class EmailChanged extends RegisterEvent {
  final BlocFormItem email;

  EmailChanged({required this.email});
}

class LastNameChanged extends RegisterEvent {
  final BlocFormItem lastname;

  LastNameChanged({required this.lastname});
}

class PhoneChanged extends RegisterEvent {
  final BlocFormItem phone;

  PhoneChanged({required this.phone});
}

class PasswordChanged extends RegisterEvent {
  final BlocFormItem password;

  PasswordChanged({required this.password});
}

class PasswordConfirmChanged extends RegisterEvent {
  final BlocFormItem passwordConfirm;

  PasswordConfirmChanged({required this.passwordConfirm});
}

class FormSubmit extends RegisterInitEvent {}

class FormReset extends RegisterInitEvent {}
