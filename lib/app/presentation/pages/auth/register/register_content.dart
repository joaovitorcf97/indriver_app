import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/bloc/register_event.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/bloc/register_state.dart';
import 'package:indriver_app/app/presentation/utils/bloc_form_item.dart';
import 'package:indriver_app/app/presentation/widgets/custom_button.dart';
import 'package:indriver_app/app/presentation/widgets/custom_text_field.dart';

class RegisterContent extends StatelessWidget {
  final RegisterState state;

  const RegisterContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 14, 29, 106),
                Color.fromARGB(255, 30, 112, 227),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Form(
                key: state.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textRegister(),
                    CustomTextField(
                      text: 'Name',
                      icon: Icons.person_2_outlined,
                      onChanged: (value) {
                        context.read<RegisterBloc>().add(
                              NameChanged(name: BlocFormItem(value: value)),
                            );
                      },
                      validator: (value) {
                        return state.name.error;
                      },
                    ),
                    CustomTextField(
                      text: 'Lastname',
                      icon: Icons.person_2_outlined,
                      onChanged: (value) {
                        context.read<RegisterBloc>().add(
                              LastNameChanged(
                                  lastname: BlocFormItem(value: value)),
                            );
                      },
                      validator: (value) {
                        return state.lastname.error;
                      },
                    ),
                    CustomTextField(
                      text: 'E-mal',
                      icon: Icons.email_outlined,
                      onChanged: (value) {
                        context.read<RegisterBloc>().add(
                              EmailChanged(email: BlocFormItem(value: value)),
                            );
                      },
                      validator: (value) {
                        return state.email.error;
                      },
                    ),
                    CustomTextField(
                      text: 'Phone',
                      icon: Icons.phone_outlined,
                      onChanged: (value) {
                        context.read<RegisterBloc>().add(
                              PhoneChanged(phone: BlocFormItem(value: value)),
                            );
                      },
                      validator: (value) {
                        return state.phone.error;
                      },
                    ),
                    CustomTextField(
                      text: 'Password',
                      icon: Icons.password_outlined,
                      onChanged: (value) {
                        context.read<RegisterBloc>().add(
                              PasswordChanged(
                                  password: BlocFormItem(value: value)),
                            );
                      },
                      validator: (value) {
                        return state.password.error;
                      },
                    ),
                    CustomTextField(
                      text: 'Password confirm',
                      icon: Icons.password_outlined,
                      onChanged: (value) {
                        context.read<RegisterBloc>().add(
                              PasswordConfirmChanged(
                                  passwordConfirm: BlocFormItem(value: value)),
                            );
                      },
                      validator: (value) {
                        return state.confirmPassword.error;
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Register',
                      onPressed: () {
                        if (state.formKey!.currentState!.validate()) {
                          context.read<RegisterBloc>().add(FormSubmit());
                          context.read<RegisterBloc>().add(FormReset());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textRegister() {
    return const Text(
      'Register',
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
