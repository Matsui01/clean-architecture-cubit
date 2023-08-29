import 'dart:io' show HttpStatus;

import 'package:clean_architecture_cubit/src/utils/resources/api_response.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utils/resources/api_error.dart';

abstract class BaseApiRepository {
  @protected
  Future<ApiResponse<T>> getResponse<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    final httpResponse = await request();
    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return ApiSuccess(httpResponse.data);
    } else {
      return ApiError(AppError(
        code: httpResponse.response.data,
        message: '',
      ));
    }
  }
}
