import 'package:app_canchitas_2025/features/fields/domain/usecases/get_establishment.dart';
import 'package:app_canchitas_2025/features/fields/presentation/home/bloc/establishment_display_state.dart';
import 'package:app_canchitas_2025/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstablishmentsDisplayCubit extends Cubit<EstablishmentsDisplayState> {
  EstablishmentsDisplayCubit() : super(EstablishmentsLoading());

  void displayEstablishment() async {   
    var result  =await sl<GetEstablishmentUseCase>().call();
    result.fold((error){
      return emit(LoadEstablishmentFailure(errorMessage: error));
    }, (data) {
      return emit(EstablishmentsLoaded(establishments: data));
    });
  }

}