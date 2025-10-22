import 'package:app_canchitas_2025/common/bloc/auth/auth_state.dart';
import 'package:app_canchitas_2025/common/bloc/auth/auth_state_cubit.dart';
import 'package:app_canchitas_2025/presentation/auth/pages/signup.dart';
import 'package:app_canchitas_2025/presentation/home/pages/home.dart';
import 'package:app_canchitas_2025/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      AuthStateCubit()
        ..appStarted(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthStateCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthenticatedState) {
                return HomePage();
              }
              if (state is UnauthenticatedState) {
                return SignUpPage();
              }
              return Container();
            },
          )
      ),
    );
  }
}