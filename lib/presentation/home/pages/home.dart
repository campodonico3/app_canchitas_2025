import 'package:app_canchitas_2025/common/widgets/button/basic_app_button.dart';
import 'package:app_canchitas_2025/domain/entities/user.dart';
import 'package:app_canchitas_2025/presentation/home/bloc/user_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_display_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UserDisplayCubit()..displayUser(),
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
      child: BasicAppButton(title: 'Logout', onPressed: () {}),
    );
  }
}
