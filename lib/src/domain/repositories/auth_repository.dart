import '../../utils/resources/api_response.dart';
import '../models/requests/auth_request.dart';
import '../models/token.dart';

abstract class AuthRepository {
  Future<ApiResponse<Token>> login(AuthRequest authRequest);

  Future<ApiResponse<void>> logout();

  Future<ApiResponse<Token>> refreshToken(Token token);
}
