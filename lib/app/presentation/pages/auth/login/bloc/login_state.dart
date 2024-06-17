// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_app/app/domain/utils/resource.dart';
import 'package:indriver_app/app/presentation/utils/bloc_form_item.dart';

class LoginState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final BlocFormItem email;
  final BlocFormItem password;
  final Resource? response;

  const LoginState({
    this.email = const BlocFormItem(error: 'Enter e-mail'),
    this.password = const BlocFormItem(error: 'Enter password'),
    this.formKey,
    this.response,
  });

  LoginState copyWith({
    GlobalKey<FormState>? formKey,
    BlocFormItem? email,
    BlocFormItem? password,
    Resource? response,
  }) {
    return LoginState(
      formKey: formKey ?? this.formKey,
      email: email ?? this.email,
      password: password ?? this.password,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        response,
      ];
}
