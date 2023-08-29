import 'package:clean_architecture_cubit/src/get_it.dart';
import 'package:dio/dio.dart';

import '../../domain/models/token.dart';
import '../../domain/repositories/auth_repository.dart';
import 'api_response.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final currentToken = getIt<Token>();
    options.headers['Authorization'] = currentToken.authorization;
    super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final currentToken = getIt<Token>();
      ApiResponse<Token> response = await getIt<AuthRepository>().refreshToken(currentToken);

      if (response is ApiSuccess) {
        err.requestOptions.headers['Authorization'] = response.data?.authorization;
      }

      // Repeat the request with the updated header
      return handler.resolve(await getIt<Dio>().fetch(err.requestOptions));
    }
    return handler.next(err);
    // super.onError(e, handler);
  }
}
