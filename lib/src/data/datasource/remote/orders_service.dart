import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/responses/order_response.dart';

part 'orders_service.g.dart';

@RestApi(baseUrl: 'baseUrl', parser: Parser.MapSerializable)
abstract class OrdersService {
  factory OrdersService(Dio dio, {String baseUrl}) = _OrdersService;

  @GET('/top-headlines')
  Future<HttpResponse<OrderResponse>> getOrder({
    @Query("id") required String parameter,
  });
}
