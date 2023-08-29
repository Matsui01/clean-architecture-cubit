import 'package:clean_architecture_cubit/src/utils/storage/token_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/token.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../utils/resources/api_response.dart';

class SpashCubit extends Cubit<double> {
  final AuthRepository _authRepository;

  SpashCubit(this._authRepository) : super(100);

  void setDistance(double distance) {
    emit(distance);
  }

  Future<bool> login() async {
    Token token = await TokenStorage.loadToken();

    ApiResponse<Token> apiResponse = await _authRepository.refreshToken(token);

    switch (apiResponse.runtimeType) {
      case ApiSuccess:
        await TokenStorage.saveToken(apiResponse.data);
        return true;
      case ApiError:
        return false;
      default:
        return false;
    }
  }
}
