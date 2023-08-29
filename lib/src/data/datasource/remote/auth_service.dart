import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/token.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: 'baseUrl', parser: Parser.MapSerializable)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('/login')
  Future<HttpResponse<Token>> login({
    @Query("email") required String email,
    @Query("password") required String password,
  });

  @POST('/refreshToken')
  Future<HttpResponse<Token>> refreshToken({
    @Query("access_token") required String token,
  });

  @POST('/logout')
  Future<HttpResponse<void>> logout();
}
