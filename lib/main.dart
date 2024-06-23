import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indriver_app/app/presentation/pages/auth/login/login_page.dart';
import 'package:indriver_app/app/presentation/pages/auth/register/register_page.dart';
import 'package:indriver_app/app/presentation/pages/client/home/client_home_page.dart';
import 'package:indriver_app/bloc_provider.dart';
import 'package:indriver_app/injection.dart';

void main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProvider,
      child: MaterialApp(
        builder: FToastBuilder(),
        debugShowCheckedModeBanner: false,
        title: 'InDriver App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => const LoginPage(),
          'register': (BuildContext context) => const RegisterPage(),
          'client/home': (BuildContext context) => const ClientHomePage(),
        },
      ),
    );
  }
}
