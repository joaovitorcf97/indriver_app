import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indriver_app/app/domain/model/auth_response.dart';
import 'package:indriver_app/app/domain/utils/resource.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/login_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final response = state.response;

          if (response is ErrorData) {
            Fluttertoast.showToast(
              msg: response.message,
              toastLength: Toast.LENGTH_LONG,
            );
          } else if (response is Success) {
            final authResponse = response.data as AuthResponse;
            context.read<LoginBloc>().add(
                  SaveUserSession(authResponse: authResponse),
                );
            Navigator.pushNamedAndRemoveUntil(
              context,
              'client/home',
              (route) => false,
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final response = state.response;

            if (response is Loading) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              );
            }

            return LoginContent(state: state);
          },
        ),
      ),
    );
  }
}
