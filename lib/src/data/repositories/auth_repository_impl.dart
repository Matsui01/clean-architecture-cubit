// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_cubit/src/data/datasource/remote/auth_service.dart';
import 'package:clean_architecture_cubit/src/data/repositories/base/base_api_repository.dart';
import 'package:clean_architecture_cubit/src/domain/models/requests/auth_request.dart';
import 'package:clean_architecture_cubit/src/domain/models/token.dart';
import 'package:clean_architecture_cubit/src/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_cubit/src/utils/resources/api_response.dart';

class AuthRepositoryImpl extends BaseApiRepository implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl({
    required this.authService,
  });

  @override
  Future<ApiResponse<Token>> login(AuthRequest authRequest) {
    return getResponse<Token>(
      request: () => authService.login(
        email: authRequest.email,
        password: authRequest.password,
      ),
    );
  }

  @override
  Future<ApiResponse<void>> logout() {
    return getResponse<void>(
      request: () => authService.logout(),
    );
  }

  @override
  Future<ApiResponse<Token>> refreshToken(Token token) {
    return getResponse<Token>(
      request: () => authService.refreshToken(
        token: token.authorization,
      ),
    );
  }
}
