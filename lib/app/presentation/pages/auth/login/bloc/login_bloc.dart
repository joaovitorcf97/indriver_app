import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_app/app/domain/useCases/auth/auth_usecases.dart';
import 'package:indriver_app/app/domain/utils/resource.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_app/app/presentation/utils/bloc_form_item.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthUsecases authUsecases;
  final formKey = GlobalKey<FormState>();

  LoginBloc({required this.authUsecases}) : super(const LoginState()) {
    on<LoginInitEvent>(_initForm);
    on<EmailChanged>(_setEmail);
    on<PasswordChanged>(_setPassword);
    on<FormSubmit>(_formSubmit);
  }

  void _initForm(LoginInitEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(formKey: formKey));
  }

  void _setEmail(EmailChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: BlocFormItem(
          value: event.email.value,
          error: event.email.value.isEmpty ? 'Enter e-mail' : null,
        ),
        formKey: formKey,
      ),
    );
  }

  void _setPassword(PasswordChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        password: BlocFormItem(
          value: event.password.value,
          error: event.password.value.isEmpty
              ? 'Enter password'
              : event.password.value.length < 6
                  ? 'Minimum 6 characters'
                  : null,
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _formSubmit(FormSubmit event, Emitter<LoginState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    Resource response = await authUsecases.login.run(
      email: state.email.value,
      password: state.password.value,
    );

    emit(state.copyWith(response: response, formKey: formKey));
  }
}
