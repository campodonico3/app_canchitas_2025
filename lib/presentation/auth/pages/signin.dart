import 'package:app_canchitas_2025/common/bloc/button/button_state.dart';
import 'package:app_canchitas_2025/common/bloc/button/button_state_cubit.dart';
import 'package:app_canchitas_2025/domain/entities/signin_params.dart';
import 'package:app_canchitas_2025/domain/usecases/signin.dart';
import 'package:app_canchitas_2025/presentation/auth/pages/signup.dart';
import 'package:app_canchitas_2025/presentation/home/pages/home.dart';
import 'package:app_canchitas_2025/service_locator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/button/basic_app_button.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }

            if(state is ButtonFailureState){
              var snackBar = SnackBar(content: Text(state.errorMessage),);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: SafeArea(
            minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _signIn(),
                SizedBox(height: 50),
                _emailField(),
                SizedBox(height: 20),
                _passwordField(),
                SizedBox(height: 60),
                _createAccountButton(),
                SizedBox(height: 20),
                _signUpText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signIn() {
    return Text(
      'Sign In',
      style: TextStyle(
        color: Color(0xff2A4ECA),
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
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

  Widget _createAccountButton() {
    return _LoginButton(
      emailController: _emailController,
      passwordController: _passwordController,
    );
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t you have account?',
            style: TextStyle(
              color: Color(0xff3B4054),
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
              color: Color(0xff2A4ECA),
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
          ),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const _LoginButton({
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BasicAppButton(
      title: 'Login',
      onPressed: () {
        context.read<ButtonStateCubit>().execute(
          params: SignInParams(
            email: emailController.text,
            password: passwordController.text,
          ),
          usecase: sl<SignInUseCase>(),
        );
      },
    );
  }
}
