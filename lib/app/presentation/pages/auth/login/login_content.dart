import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_app/app/presentation/utils/bloc_form_item.dart';
import 'package:indriver_app/app/presentation/widgets/custom_button.dart';
import 'package:indriver_app/app/presentation/widgets/custom_text_field.dart';

class LoginContent extends StatelessWidget {
  final LoginState state;

  const LoginContent({super.key, required this.state});

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
          child: SingleChildScrollView(
            child: Form(
              key: state.formKey,
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 68),
                    _textWelcome('Welcome'),
                    _textWelcome('back...'),
                    _imageCar(),
                    _textLogin(),
                    CustomTextField(
                      text: 'E-mail',
                      icon: Icons.email_outlined,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                            EmailChanged(email: BlocFormItem(value: value)));
                      },
                      validator: (value) {
                        return state.email.error;
                      },
                    ),
                    CustomTextField(
                      text: 'Password',
                      icon: Icons.password_outlined,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(PasswordChanged(
                            password: BlocFormItem(value: value)));
                      },
                      validator: (value) {
                        return state.password.error;
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Sign In',
                      onPressed: () {
                        if (state.formKey!.currentState!.validate()) {
                          context.read<LoginBloc>().add(FormSubmit());
                        }
                      },
                    ),
                    const SizedBox(height: 34),
                    _separator(),
                    _textDontHaveAccount(context),
                    const SizedBox(height: 44),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don`t have an account?',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
          child: const Text(
            'Register',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageCar() {
    return Container(
      alignment: Alignment.centerRight,
      child: Image.asset(
        'assets/img/car_white.png',
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _textLogin() {
    return const Text(
      'Login',
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _textWelcome(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _separator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 48,
          height: 1,
          color: Colors.white,
        ),
        const SizedBox(width: 6),
        const Text(
          'or',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(width: 6),
        Container(
          width: 48,
          height: 1,
          color: Colors.white,
        ),
      ],
    );
  }
}
