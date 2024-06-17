import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/login_page.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()..add(LoginInitEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'InDriver App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => const LoginPage(),
          'register': (BuildContext context) => const RegisterPage()
        },
      ),
    );
  }
}
