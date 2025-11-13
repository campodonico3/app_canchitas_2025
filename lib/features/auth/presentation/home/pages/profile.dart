import 'package:app_canchitas_2025/common/bloc/auth/auth_state.dart';
import 'package:app_canchitas_2025/common/bloc/auth/auth_state_cubit.dart';
import 'package:app_canchitas_2025/common/bloc/button/button_state.dart';
import 'package:app_canchitas_2025/common/bloc/button/button_state_cubit.dart';
import 'package:app_canchitas_2025/common/widgets/button/basic_app_button.dart';
import 'package:app_canchitas_2025/features/auth/domain/entities/user.dart';
import 'package:app_canchitas_2025/features/auth/domain/usecases/logout.dart';
import 'package:app_canchitas_2025/features/auth/presentation/auth/pages/signup.dart';
import 'package:app_canchitas_2025/features/auth/presentation/home/bloc/user_display_cubit.dart';
import 'package:app_canchitas_2025/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_display_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthStateCubit, AuthState>(
      listener: (context, state) {
        if (state is UnauthenticatedState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignUpPage()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => UserDisplayCubit()..displayUser(),
            ),
            BlocProvider(create: (context) => ButtonStateCubit()),
          ],
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonSuccessState) {
                context.read<AuthStateCubit>().logout();
              }
            },
            child: Center(
              child: BlocBuilder<UserDisplayCubit, UserDisplayState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return CircularProgressIndicator();
                  }
                  if (state is UserLoaded) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _username(state.userEntity),
                        SizedBox(height: 10),
                        _email(state.userEntity),
                        _logout(context),
                      ],
                    );
                  }
                  if (state is LoadUserFailure) {
                    return Text(state.errorMessage);
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _username(UserEntity user) {
    return Text(
      user.username,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
    );
  }

  Widget _email(UserEntity user) {
    return Text(
      user.email,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
    );
  }

  Widget _logout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: BasicAppButton(
        title: 'Logout',
        onPressed: () {
          context.read<ButtonStateCubit>().execute(
            usecase: sl<LogoutUseCase>(),
          );
        },
      ),
    );
  }

  /* Widget _logoutButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: ElevatedButton.icon(
        onPressed: () {
          context.read<AuthStateCubit>().logout();
        },
        icon: Icon(Icons.logout),
        label: Text('Cerrar Sesión'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  } */
}
