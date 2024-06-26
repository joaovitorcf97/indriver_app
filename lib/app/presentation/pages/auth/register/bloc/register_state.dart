// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_app/app/domain/model/user.dart';
import 'package:indriver_app/app/domain/utils/resource.dart';
import 'package:indriver_app/app/presentation/utils/bloc_form_item.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  toUser() => User(
        name: name.value,
        lastname: lastname.value,
        email: email.value,
        phone: phone.value,
        password: password.value,
      );

  const RegisterState({
    this.name = const BlocFormItem(error: 'Enter name'),
    this.lastname = const BlocFormItem(error: 'Enter lastname'),
    this.email = const BlocFormItem(error: 'Enter email'),
    this.phone = const BlocFormItem(error: 'Enter phone'),
    this.password = const BlocFormItem(error: 'Enter password'),
    this.confirmPassword = const BlocFormItem(error: 'Enter confirm password'),
    this.formKey,
    this.response,
  });

  RegisterState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return RegisterState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formKey: formKey ?? this.formKey,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [
        name,
        lastname,
        email,
        phone,
        password,
        confirmPassword,
        response,
      ];
}
