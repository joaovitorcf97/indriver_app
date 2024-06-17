import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/bloc/register_event.dart';

List<BlocProvider> blocProvider = [
  BlocProvider<LoginBloc>(
    create: (context) => LoginBloc()..add(LoginInitEvent()),
  ),
  BlocProvider<RegisterBloc>(
    create: (context) => RegisterBloc()..add(RegisterInitEvent()),
  ),
];
