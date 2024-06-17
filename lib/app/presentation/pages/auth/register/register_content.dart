import 'package:flutter/material.dart';
import 'package:indriver_app/app/presentation/widgets/custom_button.dart';
import 'package:indriver_app/app/presentation/widgets/custom_text_field.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textRegister(),
                  CustomTextField(
                    text: 'Name',
                    icon: Icons.person_2_outlined,
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    text: 'Username',
                    icon: Icons.person_2_outlined,
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    text: 'E-mal',
                    icon: Icons.email_outlined,
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    text: 'Phone',
                    icon: Icons.phone_outlined,
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    text: 'Password',
                    icon: Icons.password_outlined,
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    text: 'Password confirm',
                    icon: Icons.password_outlined,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: 'Register',
                    onPressed: () {},
                  ),
                ],
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
