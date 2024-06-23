import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:indriver_app/app/domain/useCases/auth/auth_usecases.dart';
import 'package:indriver_app/app/domain/utils/resource.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/bloc/register_event.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/bloc/register_state.dart';
import 'package:indriver_app/app/presentation/utils/bloc_form_item.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthUsecases authUsecases;
  final formKey = GlobalKey<FormState>();

  RegisterBloc(this.authUsecases) : super(const RegisterState()) {
    on<RegisterInitEvent>(_initForm);
    on<NameChanged>(_setName);
    on<EmailChanged>(_setEmail);
    on<LastNameChanged>(_setLastname);
    on<PhoneChanged>(_setPhone);
    on<PasswordChanged>(_setPassword);
    on<PasswordConfirmChanged>(_setPasswordConfirm);
    on<FormSubmit>(_formSubmit);
    on<FormReset>(_resetForm);
  }

  void _initForm(RegisterInitEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(formKey: formKey));
  }

  void _setName(NameChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isEmpty ? 'Enter name' : null,
        ),
        formKey: formKey,
      ),
    );
  }

  void _setEmail(EmailChanged event, Emitter<RegisterState> emit) {
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

  void _setLastname(LastNameChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        lastname: BlocFormItem(
          value: event.lastname.value,
          error: event.lastname.value.isEmpty ? 'Enter lastname' : null,
        ),
        formKey: formKey,
      ),
    );
  }

  void _setPhone(PhoneChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        phone: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isEmpty ? 'Enter phone' : null,
        ),
        formKey: formKey,
      ),
    );
  }

  void _setPassword(PasswordChanged event, Emitter<RegisterState> emit) {
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

  void _setPasswordConfirm(
      PasswordConfirmChanged event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        confirmPassword: BlocFormItem(
          value: event.passwordConfirm.value,
          error: event.passwordConfirm.value.isEmpty
              ? 'Enter password'
              : event.passwordConfirm.value.length < 6
                  ? 'Minimum 6 characters'
                  : event.passwordConfirm.value != state.password.value
                      ? 'wrong password'
                      : null,
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _formSubmit(
      FormSubmit event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    Resource response = await authUsecases.regiter.run(state.toUser());

    emit(state.copyWith(response: response, formKey: formKey));
  }

  void _resetForm(FormReset event, Emitter<RegisterState> emit) {
    state.formKey!.currentState!.reset();
  }
}
