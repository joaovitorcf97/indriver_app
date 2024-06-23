import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indriver_app/app/domain/utils/resource.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/bloc/register_event.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/bloc/register_state.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/register_content.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        final response = state.response;

        if (response is ErrorData) {
          Fluttertoast.showToast(
            msg: response.message,
            toastLength: Toast.LENGTH_LONG,
          );
        } else if (response is Success) {
          context.read<RegisterBloc>().add(FormReset());
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return RegisterContent(state: state);
        },
      ),
    );
  }
}
