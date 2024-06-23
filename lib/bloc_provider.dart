import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_app/app/domain/useCases/auth/auth_usecases.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/bloc/register_event.dart';
import 'package:indriver_app/app/presentation/pages/client/home/bloc/client_home_bloc.dart';

import 'injection.dart';

List<BlocProvider> blocProvider = [
  BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(
      authUsecases: locator<AuthUsecases>(),
    )..add(LoginInitEvent()),
  ),
  BlocProvider<RegisterBloc>(
    create: (context) => RegisterBloc(
      locator<AuthUsecases>(),
    )..add(RegisterInitEvent()),
  ),
  BlocProvider<ClientHomeBloc>(
    create: (context) => ClientHomeBloc(
      locator<AuthUsecases>(),
    ),
  ),
];
