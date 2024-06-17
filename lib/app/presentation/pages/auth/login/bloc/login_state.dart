import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_app/app/presentation/utils/bloc_form_item.dart';

class LoginState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final BlocFormItem email;
  final BlocFormItem password;

  const LoginState({
    this.email = const BlocFormItem(error: 'Enter e-mail'),
    this.password = const BlocFormItem(error: 'Enter password'),
    this.formKey,
  });

  LoginState copyWith({
    BlocFormItem? email,
    BlocFormItem? password,
    GlobalKey<FormState>? formKey,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [email, password];
}
