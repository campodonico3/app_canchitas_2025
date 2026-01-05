import 'package:app_canchitas_2025/common/bloc/auth/auth_state.dart';
import 'package:app_canchitas_2025/common/bloc/auth/auth_state_cubit.dart';
import 'package:app_canchitas_2025/features/auth/presentation/auth/pages/signup.dart';
import 'package:app_canchitas_2025/features/fields/presentation/home/bloc/establishment_display_cubit.dart';
import 'package:app_canchitas_2025/features/fields/presentation/home/bloc/establishment_display_state.dart';
import 'package:app_canchitas_2025/features/fields/presentation/establishment/pages/establishment_detail.dart';
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
            child: BlocProvider(
              create: (context) =>
                  EstablishmentsDisplayCubit()..displayEstablishment(),
              child:
                  BlocBuilder<
                    EstablishmentsDisplayCubit,
                    EstablishmentsDisplayState
                  >(
                    builder: (context, state) {
                      // Estado está cargango
                      if (state is EstablishmentsLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF203D3F),
                          ),
                        );
                      }

                      // Estado de error al cargar los establecimientos
                      if (state is LoadEstablishmentFailure) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: .center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Colors.white,
                                size: 48,
                              ),
                              SizedBox(height: 16),
                              Text(
                                state.errorMessage,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        );
                      }

                      // Estado con datos cargados correctamente
                      if (state is EstablishmentsLoaded) {
                        final establishments = state.establishments;                        
                        if (establishments.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.inbox_outlined,
                                  color: Colors.white,
                                  size: 48,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'No hay establecimientos disponibles',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return LayoutBuilder(
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
                                    SizedBox(height: 21),
                                    /* EstablishmentCard(
                                    name: 'Damker',
                                    location: 'Chiclayo',
                                    qualification: 4,
                                    imageUrl: 'assets/images/campo1.png',
                                    onBookPressed: () {
                                      // Lógica de reserva
                                    },
                                  ), */
                                    ...establishments.map((establishment) {
                                      return EstablishmentCard(
                                        name: establishment.name,
                                        location: establishment.city,
                                        qualification: 4,
                                        imageUrl: establishment.images[0],
                                        openTime: establishment.openTime, 
                                        closeTime: establishment.closeTime,
                                        onBookPressed: () {
                                          debugPrint('Reservar canchita');
                                        },
                                        onImageTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => EstablishmentDetail()));
                                        },
                                      );
                                    }),
                                    SizedBox(height: 21),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Text('No se cumplieron nunguno de los estados');
                    },
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
