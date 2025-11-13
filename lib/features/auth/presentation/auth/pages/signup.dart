import 'package:app_canchitas_2025/common/bloc/button/button_state_cubit.dart';
import 'package:app_canchitas_2025/features/auth/domain/entities/signup_params.dart';
import 'package:app_canchitas_2025/features/auth/domain/usecases/signup.dart';
import 'package:app_canchitas_2025/features/auth/presentation/auth/pages/signin.dart';
import 'package:app_canchitas_2025/features/fields/presentation/home/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/bloc/button/button_state.dart';
import '../../../../../common/widgets/button/basic_app_button.dart';
import '../../../../../service_locator.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            // Si se crea correctamente el usuario, navegar a la pantalla de inicio
            if (state is ButtonSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }

            // Si hay un error al momento de crearse el usuario, mostrar un snackbar con el error
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: SafeArea(
            minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _signUp(),
                  SizedBox(height: 50),
                  _usernameField(),
                  SizedBox(height: 20),
                  _emailField(),
                  SizedBox(height: 20),
                  _passwordField(),
                  SizedBox(height: 60),
                  _createAccountButton(context),
                  SizedBox(height: 20),
                  _signUpText(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUp() {
    return Text(
      'Sign Up',
      style: TextStyle(
        color: Color(0xff2A4ECA),
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }

  Widget _usernameField() {
    return TextField(
      controller: _usernameController,
      decoration: InputDecoration(hintText: 'Username'),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicAppButton(
          title: 'Create Account',
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
              params: SignupParams(
                email: _emailController.text,
                password: _passwordController.text,
                username: _usernameController.text,
              ),
              usecase: sl<SignUpUseCase>(),
            );
          },
        );
      },
    );
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Do you have account?',
            style: TextStyle(
              color: Color(0xff3B4054),
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'Sign In',
            style: TextStyle(
              color: Color(0xff2A4ECA),
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
          ),
        ],
      ),
    );
  }
}
