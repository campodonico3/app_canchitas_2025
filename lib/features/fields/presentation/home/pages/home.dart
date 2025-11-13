import 'package:app_canchitas_2025/common/bloc/auth/auth_state.dart';
import 'package:app_canchitas_2025/common/bloc/auth/auth_state_cubit.dart';
import 'package:app_canchitas_2025/features/auth/presentation/auth/pages/signup.dart';
import 'package:app_canchitas_2025/features/fields/presentation/home/pages/widgets/establishment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF32BC81), Color(0xFF17563B)],
              stops: [0.0, 0.84],
            ),
          ),
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [                      
                        SizedBox(height: 21,),
                        EstablishmentCard(
                          name: 'Damker',
                          location: 'Chiclayo',
                          qualification: 4,
                          imageUrl: 'assets/images/campo1.png',
                          onBookPressed: () {
                            // Lógica de reserva
                          },
                        ),
                        SizedBox(height: 21,),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
