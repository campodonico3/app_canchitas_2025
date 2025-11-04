import 'package:app_canchitas_2025/common/bloc/button/button_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  // When the btn is clicked we have to execute our use case
  void execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    await Future.delayed(Duration(seconds: 2));

    debugPrint('🔵 [BUTTON STATE CUBIT] Iniciando execute');
    debugPrint('🔵 [BUTTON STATE CUBIT] Params: $params');

    try {      
      
      Either result = await usecase.call(params: params);

      debugPrint('🔵 [BUTTON STATE CUBIT] Result recibido del UseCase');
      debugPrint('🔵 [BUTTON STATE CUBIT] Result type: ${result.runtimeType}');

      result.fold(
        (error) {
          debugPrint('🔵 ❌ [BUTTON STATE CUBIT] LEFT - Error: $error');
          debugPrint('🔵 ❌ [BUTTON STATE CUBIT] Error type: ${error.runtimeType}');
          emit(ButtonFailureState(errorMessage: error));
        },
        (data) {
          debugPrint('🔵 ✅ [BUTTON STATE CUBIT] RIGHT - Success');
          debugPrint('🔵 ✅ [BUTTON STATE CUBIT] Data type: ${data.runtimeType}');
          debugPrint('🔵 ✅ [BUTTON STATE CUBIT] Data: $data');
          emit(ButtonSuccessState());
        },
      );

    } catch (e) {
      debugPrint('🔵 💥 [BUTTON STATE CUBIT] Exception caught: $e');
      debugPrint('🔵 💥 [BUTTON STATE CUBIT] Exception type: ${e.runtimeType}');
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
