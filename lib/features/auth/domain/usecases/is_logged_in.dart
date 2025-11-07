import 'package:app_canchitas_2025/features/auth/domain/repository/auth.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({dynamic params}) async {
    // Delegar al repository
    return sl<AuthRepository>().isLoggedIn(); // <- Use Contract
  }
}