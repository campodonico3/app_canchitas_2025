import 'package:app_canchitas_2025/common/bloc/button/button_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  // When the btn is clicked we have to execute our use case
  void execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    await Future.delayed(Duration(seconds: 2,));
    try {
      Either result = await usecase.call(params: params);

      result.fold((error) {
        emit(ButtonFailureState(errorMessage: error));
      }, (data) {
        emit(ButtonSuccessState());
      });

    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
